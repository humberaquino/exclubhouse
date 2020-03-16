defmodule ExClubhouse.Model.Input.Label do
  @moduledoc """
  Input label model
  """

  @type t :: %__MODULE__{
          color: binary() | nil,
          description: binary() | nil,
          external_id: binary() | nil,
          name: binary()
        }

  defstruct color: nil,
            description: nil,
            external_id: nil,
            name: nil
end
