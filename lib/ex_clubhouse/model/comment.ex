defmodule ExClubhouse.Model.Comment do
  @moduledoc """
  Comment model
  """

  @type t :: %__MODULE__{
          app_url: binary(),
          author_id: binary() | nil,
          created_at: binary(),
          entity_type: binary(),
          external_id: binary() | nil,
          group_mention_ids: list(binary()),
          id: integer(),
          member_mention_ids: list(binary()),
          mention_ids: list(binary()),
          position: integer(),
          story_id: integer(),
          text: binary(),
          updated_at: binary()
        }

  defstruct app_url: nil,
            author_id: nil,
            created_at: nil,
            entity_type: nil,
            external_id: nil,
            group_mention_ids: [],
            id: nil,
            member_mention_ids: [],
            mention_ids: [],
            position: nil,
            story_id: nil,
            text: nil,
            updated_at: nil
end
