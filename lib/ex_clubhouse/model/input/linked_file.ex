defmodule ExClubhouse.Model.Input.LinkedFile do
  @moduledoc """
    Linked file input model
  """

  @type t :: %__MODULE__{
          content_type: binary() | nil,
          description: binary() | nil,
          name: binary(),
          size: integer() | nil,
          story_id: integer() | nil,
          thumbnail_url: binary() | nil,
          type: :google | :url | :dropbox | :box | :onedrive,
          uploader_id: binary() | nil,
          url: binary()
        }

  defstruct content_type: nil,
            description: nil,
            name: nil,
            size: nil,
            story_id: nil,
            thumbnail_url: nil,
            type: nil,
            uploader_id: nil,
            url: nil
end
