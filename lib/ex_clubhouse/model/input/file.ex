defmodule ExClubhouse.Model.Input.File do
  @moduledoc """
  File input model
  """

  @type t :: %__MODULE__{
          created_at: binary(),
          description: binary(),
          external_id: binary(),
          name: binary(),
          updated_at: binary(),
          uploader_id: binary()
        }

  defstruct created_at: nil,
            description: nil,
            external_id: nil,
            name: nil,
            updated_at: nil,
            uploader_id: nil
end
