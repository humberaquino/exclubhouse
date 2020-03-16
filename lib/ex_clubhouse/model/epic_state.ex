defmodule ExClubhouse.Model.EpicState do
  @moduledoc """
  Epic state model
  """

  @type t :: %__MODULE__{
          color: binary(),
          created_at: binary(),
          description: binary(),
          entity_type: binary(),
          id: integer(),
          name: binary(),
          position: integer(),
          type: binary(),
          updated_at: binary()
        }

  defstruct color: nil,
            created_at: nil,
            description: nil,
            entity_type: nil,
            id: nil,
            name: nil,
            position: nil,
            type: nil,
            updated_at: nil
end
