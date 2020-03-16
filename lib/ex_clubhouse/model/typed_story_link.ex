defmodule ExClubhouse.Model.TypedStoryLink do
  @moduledoc """
    TypedStoryLink moddel
  """

  @type t :: %__MODULE__{
          created_at: binary(),
          entity_type: binary(),
          id: integer(),
          object_id: integer(),
          subject_id: integer(),
          type: binary(),
          updated_at: binary(),
          verb: binary()
        }

  defstruct created_at: nil,
            entity_type: nil,
            id: nil,
            object_id: nil,
            subject_id: nil,
            type: nil,
            updated_at: nil,
            verb: nil
end
