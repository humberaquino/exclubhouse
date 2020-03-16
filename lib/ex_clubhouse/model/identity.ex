defmodule ExClubhouse.Model.Identity do
  @moduledoc """
  Identity model
  """

  @type t :: %__MODULE__{
          entity_type: binary(),
          name: binary() | nil,
          type: binary() | nil
        }

  defstruct entity_type: nil, name: nil, type: nil
end
