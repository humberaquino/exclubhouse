defmodule ExClubhouse.Model.File do
  @moduledoc """
  File response model
  """

  @type t :: %__MODULE__{
          content_type: binary(),
          created_at: binary(),
          description: binary() | nil,
          entity_type: binary(),
          external_id: binary() | nil,
          filename: binary(),
          group_mention_ids: list(binary()),
          id: integer(),
          member_mention_ids: list(binary()),
          mention_ids: list(binary()),
          name: binary(),
          size: integer(),
          story_ids: list(integer()),
          thumbnail_url: binary() | nil,
          updated_at: binary() | nil,
          uploader_id: binary(),
          url: binary() | nil
        }

  defstruct content_type: nil,
            created_at: nil,
            description: nil,
            entity_type: nil,
            external_id: nil,
            filename: nil,
            group_mention_ids: [],
            id: nil,
            member_mention_ids: [],
            mention_ids: [],
            name: nil,
            size: nil,
            story_ids: [],
            thumbnail_url: nil,
            updated_at: nil,
            uploader_id: nil,
            url: nil
end
