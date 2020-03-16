defmodule ExClubhouse.Support.ResponseBuilder do
  @moduledoc """
  Helper module to mock HTTPoison responses
  """

  def build_response(file) do
    content = File.read!(file)

    {:ok,
     %HTTPoison.Response{
       body: content,
       headers: [
         {"Date", "Sat, 29 Feb 2020 21:16:46 GMT"},
         {"Content-Type", "application/json;charset=utf-8"},
         {"Content-Length", "1083"},
         {"Connection", "keep-alive"},
         {"Vary", "Accept"},
         {"Database-Time", "470373970"},
         {"Clubhouse-Company", ""},
         {"Clubhouse-Organization", ""},
         {"Access-Control-Expose-Headers",
          "Database-Time, CH-Paginate-Incomplete, CH-Start-Time, CH-End-Time, Clubhouse-Company, Clubhouse-Organization"}
       ],
       request: %HTTPoison.Request{
         body: "\"\"",
         headers: [{"Content-Type", "application/json"}],
         method: :get,
         options: [],
         params: %{token: "1234"},
         url: "https://api.clubhouse.io/api/v3/epics?token=1234"
       },
       request_url: "https://api.clubhouse.io/api/v3/epics?token=1234",
       status_code: 200
     }}
  end

  def build_empty_response do
    {:ok,
     %HTTPoison.Response{
       body: nil,
       headers: [
         {"Date", "Sat, 29 Feb 2020 21:16:46 GMT"},
         {"Content-Type", "application/json;charset=utf-8"},
         {"Content-Length", "1083"},
         {"Connection", "keep-alive"},
         {"Vary", "Accept"},
         {"Database-Time", "470373970"},
         {"Clubhouse-Company", ""},
         {"Clubhouse-Organization", ""},
         {"Access-Control-Expose-Headers",
          "Database-Time, CH-Paginate-Incomplete, CH-Start-Time, CH-End-Time, Clubhouse-Company, Clubhouse-Organization"}
       ],
       request: %HTTPoison.Request{
         body: "\"\"",
         headers: [{"Content-Type", "application/json"}],
         method: :get,
         options: [],
         params: %{token: "1234"},
         url: "https://api.clubhouse.io/api/v3/epics?token=1234"
       },
       request_url: "https://api.clubhouse.io/api/v3/epics?token=1234",
       status_code: 204
     }}
  end

  def build_not_found_response do
    {:ok,
     %HTTPoison.Response{
       body: nil,
       headers: [
         {"Date", "Sat, 29 Feb 2020 21:16:46 GMT"},
         {"Content-Type", "application/json;charset=utf-8"},
         {"Content-Length", "1083"},
         {"Connection", "keep-alive"},
         {"Vary", "Accept"},
         {"Database-Time", "470373970"},
         {"Clubhouse-Company", ""},
         {"Clubhouse-Organization", ""},
         {"Access-Control-Expose-Headers",
          "Database-Time, CH-Paginate-Incomplete, CH-Start-Time, CH-End-Time, Clubhouse-Company, Clubhouse-Organization"}
       ],
       request: %HTTPoison.Request{
         body: "\"\"",
         headers: [{"Content-Type", "application/json"}],
         method: :get,
         options: [],
         params: %{token: "1234"},
         url: "https://api.clubhouse.io/api/v3/epics?token=1234"
       },
       request_url: "https://api.clubhouse.io/api/v3/epics?token=1234",
       status_code: 404
     }}
  end
end
