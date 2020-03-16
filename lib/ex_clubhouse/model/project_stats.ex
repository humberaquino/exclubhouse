defmodule ExClubhouse.Model.ProjectStats do
  @moduledoc """
  Project stats model
  """

  @type t :: %__MODULE__{
          num_points: integer(),
          num_related_documents: integer(),
          num_stories: integer()
        }

  defstruct num_points: nil, num_related_documents: nil, num_stories: nil
end
