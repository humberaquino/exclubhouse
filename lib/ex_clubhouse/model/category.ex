defmodule ExClubhouse.Model.Category do
  @moduledoc """
  Category response model
  """

  @type t :: %__MODULE__{
          archived: boolean(),
          color: binary() | nil,
          created_at: binary(),
          entity_type: binary(),
          external_id: binary() | nil,
          id: integer(),
          name: binary(),
          type: binary(),
          updated_at: binary()
        }

  defstruct archived: nil,
            color: nil,
            created_at: nil,
            entity_type: nil,
            external_id: nil,
            id: nil,
            name: nil,
            type: nil,
            updated_at: nil
end
