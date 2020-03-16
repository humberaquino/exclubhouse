defmodule ExClubhouse.Model.Input.Task do
  @moduledoc """
  Task input model
  """
  @type t :: %__MODULE__{
          complete: boolean(),
          created_at: binary(),
          description: binary(),
          external_id: binary(),
          owner_ids: [binary()],
          updated_at: binary()
        }
  defstruct complete: nil,
            created_at: nil,
            description: nil,
            external_id: nil,
            owner_ids: nil,
            updated_at: nil
end
