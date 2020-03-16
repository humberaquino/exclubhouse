defmodule ExClubhouse.Model.LinkedFile do
  @moduledoc """
    Linked file response model
  """

  @type t :: %__MODULE__{
          content_type: binary() | nil,
          created_at: binary(),
          description: binary() | nil,
          entity_type: binary(),
          group_mention_ids: list(binary()),
          id: binary(),
          member_mention_ids: list(binary()),
          mention_ids: list(binary()),
          name: binary(),
          size: integer() | nil,
          story_ids: list(integer()),
          thumbnail_url: binary() | nil,
          type: binary(),
          updated_at: binary(),
          uploader_id: binary(),
          url: binary()
        }

  defstruct content_type: nil,
            created_at: nil,
            description: nil,
            entity_type: nil,
            group_mention_ids: [],
            id: nil,
            member_mention_ids: [],
            mention_ids: [],
            name: nil,
            size: nil,
            story_ids: [],
            thumbnail_url: nil,
            type: nil,
            updated_at: nil,
            uploader_id: nil,
            url: nil
end
