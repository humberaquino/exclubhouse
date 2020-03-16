defmodule ExClubhouse.Client.Result do
  @moduledoc """
  Struct holding client operation and response
  """

  alias ExClubhouse.Operation

  @type t :: %__MODULE__{
          success: boolean(),
          operation: Operation.t(),
          response: HTTPoison.Response.t() | nil,
          error: HTTPoison.Error.t() | nil
        }
  defstruct success: false, operation: nil, message: nil, response: nil, error: nil
end
