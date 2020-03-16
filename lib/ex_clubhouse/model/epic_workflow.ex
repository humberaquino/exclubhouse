defmodule ExClubhouse.Model.EpicWorkflow do
  @moduledoc """
  Epir workflow model
  """

  alias ExClubhouse.Model

  @type t :: %__MODULE__{
          created_at: binary(),
          default_epic_state_id: integer(),
          entity_type: binary(),
          epic_states: list(Model.EpicState.t()),
          id: integer(),
          updated_at: binary()
        }

  defstruct created_at: nil,
            default_epic_state_id: nil,
            entity_type: nil,
            epic_states: [],
            id: nil,
            updated_at: nil
end
