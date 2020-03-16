defmodule ExClubhouse.Error do
  @moduledoc """
  Typed error
  """

  @type t :: %__MODULE__{
          type: :client | :parser,
          message: binary(),
          reason: map() | binary() | nil
        }

  defstruct type: nil, message: nil, reason: nil
end
