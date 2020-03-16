defmodule ExClubhouse.Client.HTTP do
  @moduledoc """
  Make requests to the CH backend from operations
  """

  alias ExClubhouse.{Session, Operation}
  alias ExClubhouse.Client

  @base_url "https://api.clubhouse.io/api/v3"

  @spec request(ExClubhouse.Operation.t(), ExClubhouse.Session.t(), binary() | nil) ::
          ExClubhouse.Client.Result.t()
  def request(
        %Operation{
          method: method,
          path: path,
          params: params,
          body: body,
          headers: headers,
          options: options
        } = operation,
        %Session{token: token},
        base_url \\ @base_url
      ) do
    url = "#{base_url}/#{path}"
    # The token should be part of the query
    params = Map.put(params, :token, token)

    headers = headers ++ [{"Content-Type", "application/json"}]

    request = %HTTPoison.Request{
      method: method,
      url: url,
      params: params,
      body: encoded_body(body),
      headers: headers,
      options: options
    }

    case HTTPoison.request(request) do
      {:ok, response} ->
        case response.status_code do
          code when code in 200..299 ->
            %Client.Result{success: true, response: response, operation: operation}

          code when code in [422, 404] ->
            %Client.Result{success: true, response: response, operation: operation}

          _code ->
            %Client.Result{
              success: false,
              response: response,
              operation: operation
            }
        end

      {:error, %HTTPoison.Error{} = error} ->
        %Client.Result{success: false, error: error, operation: operation}
    end
  end

  defp encoded_body("") do
    ""
  end

  # It doesn't include nil by default
  defp encoded_body(body) do
    if body do
      map = body |> Map.drop([:__meta__, :__struct__]) |> to_compact_map()

      Poison.encode!(map)
    else
      nil
    end
  end

  defp to_compact_map(map) do
    map
    |> Enum.reject(fn {_, v} -> v == nil end)
    |> Enum.into(%{})
  end
end
