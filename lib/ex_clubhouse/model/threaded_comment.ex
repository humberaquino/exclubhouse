defmodule ExClubhouse.Model.ThreadedComment do
  @moduledoc """
  Threaded comment model
  """

  @type t :: %__MODULE__{
          app_url: binary(),
          author_id: binary(),
          comments: list(),
          created_at: binary(),
          deleted: boolean(),
          entity_type: binary(),
          external_id: binary() | nil,
          group_mention_ids: list(binary()),
          id: integer(),
          member_mention_ids: list(binary()),
          mention_ids: list(binary()),
          text: binary(),
          updated_at: binary()
        }

  defstruct app_url: nil,
            author_id: nil,
            comments: [],
            created_at: nil,
            deleted: nil,
            entity_type: nil,
            external_id: nil,
            group_mention_ids: [],
            id: nil,
            member_mention_ids: [],
            mention_ids: [],
            text: nil,
            updated_at: nil
end
