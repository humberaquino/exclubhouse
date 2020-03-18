defmodule ExClubhouse.Parse.Parser do
  @moduledoc """
  Default parser. Parses HTTP/JSON responses into Elixir models
  """

  alias ExClubhouse.Error
  alias ExClubhouse.Client
  alias ExClubhouse.Parse

  @dialyzer {:nowarn_function, decode: 2}

  # 204 and 404 is a success but we return nil
  @spec parse(ExClubhouse.Client.Result.t()) ::
          {:ok, any}
          | {:ok, [any]}
          | :ok
          | :not_found
          | {:error, ExClubhouse.Error.t()}

  def parse(%Client.Result{
        success: true,
        response: %HTTPoison.Response{status_code: status_code},
        operation: _operation
      })
      when status_code in [204, 404] do
    case status_code do
      204 ->
        :ok

      404 ->
        :not_found
    end
  end

  def parse(%Client.Result{
        success: true,
        response: %HTTPoison.Response{status_code: status_code} = response,
        operation: _operation
      })
      when status_code in [400, 422] do
    json_body = Poison.decode!(response.body)

    case status_code do
      400 ->
        {:error, %Error{type: :client, message: "Invalid request", reason: json_body}}

      422 ->
        {:error, %Error{type: :client, message: "Unprocessable request", reason: json_body}}
    end
  end

  def parse(%Client.Result{success: true, response: response, operation: operation}) do
    case decode_rule_from(operation.id) do
      nil ->
        raise "Parse rule not found for operation: #{operation.id}"

      decode_rule ->
        decode(response.body, decode_rule)
    end
  end

  def parse(%Client.Result{success: false, error: %HTTPoison.Error{} = error, response: %HTTPoison.Response{} = response, operation: _operation})
      when not is_nil(response) do
    json_body = Poison.decode!(response.body)
    {:error, %Error{type: :parse, message: error.reason, reason: json_body}}
  end

  def parse(%Client.Result{success: false, error: message, response: response, operation: _operation})
      when is_binary(message) and not is_nil(response) do
    json_body = Poison.decode!(response.body)
    {:error, %Error{type: :parse, message: message, reason: json_body}}
  end

  def parse(%Client.Result{success: false, response: %HTTPoison.Response{} = response, operation: _operation})
      when not is_nil(response) do
    json_body = Poison.decode!(response.body)
    message = "Failed request with code: #{response.status_code}"
    {:error, %Error{type: :parse, message: message, reason: json_body}}
  end

  def decode(body, rule) do
    case Poison.decode(body, as: rule) do
      {:ok, json} ->
        {:ok, json}

      {:error, :invalid, reason} ->
        {:error, %Error{type: :parse, message: "Can't parse response body", reason: "Error on line: #{reason}"}}
    end
  end

  def decode_rule_from(id) do
    Parse.Rules.decode_map() |> Map.get(id)
  end
end
