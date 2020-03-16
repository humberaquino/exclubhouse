defmodule ExClubhouse.Model.EntityTemplate do
  @moduledoc """
  Entity template response model
  """

  alias ExClubhouse.Model

  @type t :: %__MODULE__{
          author_id: binary(),
          created_at: binary(),
          entity_type: binary(),
          id: binary(),
          last_used_at: binary(),
          name: binary(),
          story_contents: Model.StoryContent.t(),
          updated_at: binary()
        }

  defstruct author_id: nil,
            created_at: nil,
            entity_type: nil,
            id: nil,
            last_used_at: nil,
            name: nil,
            story_contents: nil,
            updated_at: nil
end
