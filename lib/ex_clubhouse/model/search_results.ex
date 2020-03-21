defmodule ExClubhouse.Model.SearchResults do
  @moduledoc """
  Search results model
  """

  alias ExClubhouse.Model

  @type t :: %__MODULE__{
          epics: Model.EpicSearchResults.t(),
          stories: Model.StorySearchResults.t()
        }

  defstruct epics: nil, stories: nil
end
