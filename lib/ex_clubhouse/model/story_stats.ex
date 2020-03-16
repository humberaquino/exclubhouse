defmodule ExClubhouse.Model.StoryStats do
  @moduledoc """
  Story stats model
  """

  @type t :: %__MODULE__{
          num_related_documents: integer()
        }

  defstruct num_related_documents: nil
end
