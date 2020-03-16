defmodule ExClubhouse.Model.Input.EntityTemplate do
  @moduledoc """
  Entity template input model
  """

  alias ExClubhouse.Model

  @type t :: %__MODULE__{
          author_id: binary(),
          name: binary(),
          story_contents: Model.CreateStoryContents.t()
        }

  defstruct author_id: nil, name: nil, story_contents: nil
end
