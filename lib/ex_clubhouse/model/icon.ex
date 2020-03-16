defmodule ExClubhouse.Model.Icon do
  @moduledoc """
  Icon model
  """

  @type t :: %__MODULE__{
          created_at: binary(),
          entity_type: binary(),
          id: binary(),
          updated_at: binary(),
          url: binary()
        }

  defstruct created_at: nil, entity_type: nil, id: nil, updated_at: nil, url: nil
end
