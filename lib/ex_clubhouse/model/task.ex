defmodule ExClubhouse.Model.Task do
  @moduledoc """
  Task model
  """
  @type t :: %__MODULE__{
          complete: boolean(),
          completed_at: binary() | nil,
          created_at: binary(),
          description: binary(),
          entity_type: binary(),
          external_id: binary() | nil,
          group_mention_ids: list(binary()),
          id: integer(),
          member_mention_ids: list(binary()),
          mention_ids: list(binary()),
          owner_ids: list(binary()),
          position: integer(),
          story_id: integer(),
          updated_at: binary()
        }
  defstruct complete: nil,
            completed_at: nil,
            created_at: nil,
            description: nil,
            entity_type: nil,
            external_id: nil,
            group_mention_ids: [],
            id: nil,
            member_mention_ids: [],
            mention_ids: [],
            owner_ids: [],
            position: nil,
            story_id: nil,
            updated_at: nil
end
