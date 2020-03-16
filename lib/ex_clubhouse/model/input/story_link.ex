defmodule ExClubhouse.Model.Input.StoryLink do
  @moduledoc """
  Story link input model
  """

  @type t :: %__MODULE__{
          object_id: integer(),
          subject_id: integer(),
          verb: binary()
        }

  defstruct object_id: nil, subject_id: nil, verb: nil
end
