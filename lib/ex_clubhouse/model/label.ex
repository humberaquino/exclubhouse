defmodule ExClubhouse.Model.Label do
  @moduledoc """
  Label reponse model
  """

  alias ExClubhouse.Model

  @type t :: %__MODULE__{
          app_url: binary(),
          archived: boolean(),
          color: binary() | nil,
          created_at: binary() | nil,
          description: binary() | nil,
          entity_type: binary(),
          external_id: binary() | nil,
          id: integer(),
          name: binary(),
          stats: Model.LabelStats.t(),
          updated_at: binary() | nil
        }

  defstruct app_url: nil,
            archived: true,
            color: nil,
            created_at: nil,
            description: nil,
            entity_type: nil,
            external_id: nil,
            id: nil,
            name: nil,
            stats: nil,
            updated_at: nil
end
