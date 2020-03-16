defmodule ExClubhouse.Model.CreateStoryCommentParams do
  @moduledoc """
  Story comment params
  """

  @type t :: %__MODULE__{
          author_id: binary(),
          create_at: binary(),
          external_id: binary(),
          text: binary(),
          update_at: binary()
        }

  defstruct author_id: nil, create_at: nil, external_id: nil, text: nil, update_at: nil
end
