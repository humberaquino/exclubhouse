defmodule ExClubhouse.Model.StoryLink do
  @moduledoc """
  Story link model
  """

  @type t :: %__MODULE__{
          created_at: binary(),
          entity_type: binary(),
          id: integer(),
          object_id: integer(),
          subject_id: integer(),
          updated_at: binary(),
          verb: binary()
        }

  defstruct created_at: nil,
            entity_type: nil,
            id: nil,
            object_id: nil,
            subject_id: nil,
            updated_at: nil,
            verb: nil
end
