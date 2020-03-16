defmodule ExClubhouse.Model.StoryContentsTask do
  @moduledoc """
  Story contents task respons model
  """
  @type t :: %__MODULE__{
          complete: boolean(),
          description: binary(),
          external_id: binary() | nil,
          owner_ids: list(binary()),
          position: integer()
        }

  defstruct complete: nil, description: nil, external_id: nil, owner_ids: [], position: nil
end
