Mimic.copy(HTTPoison)
Mimic.copy(Elixir.File)

Code.require_file("test/support/response_builder.ex")

ExUnit.start()
