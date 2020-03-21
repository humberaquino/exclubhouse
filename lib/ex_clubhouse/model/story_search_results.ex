defmodule ExClubhouse.Model.StorySearchResults do
  @moduledoc """
  Story search results
  """

  alias ExClubhouse.Model

  @type t :: %__MODULE__{
          cursors: list(binary()),
          data: list(Model.Story.t()),
          next: binary() | nil,
          total: integer()
        }

  defstruct cursors: nil, data: nil, next: nil, total: nil
end
