defmodule ExClubhouse.Model.CreateTaskParams do
  @moduledoc """
  Create task params model
  """

  @type t :: %__MODULE__{
          completed: boolean(),
          created_at: binary(),
          description: binary(),
          external_id: binary(),
          owner_ids: list(binary()),
          updated_at: binary()
        }

  defstruct completed: nil,
            created_at: nil,
            description: nil,
            external_id: [],
            owner_ids: nil,
            updated_at: nil
end
