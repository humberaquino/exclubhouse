defmodule ExClubhouse.Model.Repository do
  @moduledoc """
  Repository model
  """

  @type t :: %__MODULE__{
          created_at: binary() | nil,
          entity_type: binary(),
          external_id: binary() | nil,
          full_name: binary() | nil,
          id: integer() | nil,
          name: binary() | nil,
          type: binary(),
          updated_at: binary() | nil,
          url: binary() | nil
        }

  defstruct created_at: nil,
            entity_type: nil,
            external_id: nil,
            full_name: nil,
            id: nil,
            name: nil,
            type: nil,
            updated_at: nil,
            url: nil
end
