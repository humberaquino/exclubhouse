defmodule ExClubhouse.Client.HTTP do
  @moduledoc """
  Make requests to the CH backend from operations
  """

  alias ExClubhouse.{Session, Operation}
  alias ExClubhouse.Client

  @base_url "https://api.app.shortcut.com/api/v3"

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

    content_type =
      case body do
        {:multipart, _} ->
          [{"Content-Type", "multipart/form-data"}]

        _ ->
          [{"Content-Type", "application/json"}]
      end

    headers = headers ++ content_type

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

  @spec upload(ExClubhouse.Operation.t(), ExClubhouse.Session.t(), binary() | nil) ::
          ExClubhouse.Client.Result.t()
  def upload(
        %Operation{body: {:multipart, multipart}} = operation,
        %Session{} = session,
        base_url \\ @base_url
      ) do
    failed_path =
      multipart
      |> Enum.find(fn {:file, path, _, _} ->
        not File.exists?(path)
      end)

    if failed_path do
      %Client.Result{success: false, error: "Failed path: #{inspect(failed_path)}", operation: operation}
    else
      request(operation, session, base_url)
    end
  end

  # Used by multipar
  defp encoded_body(tuple) when is_tuple(tuple) do
    tuple
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
