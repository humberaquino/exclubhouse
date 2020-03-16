defmodule ExClubhouse.Model.Workflow do
  @moduledoc """
  Workflow model
  """

  alias ExClubhouse.Model

  @type t :: %__MODULE__{
          auto_assign_owner: boolean(),
          created_at: binary(),
          default_state_id: integer(),
          description: binary(),
          entity_type: binary(),
          id: integer(),
          name: binary(),
          project_ids: list(integer()),
          states: list(Model.WorkflowState.t()),
          team_id: integer(),
          updated_at: binary()
        }
  defstruct auto_assign_owner: nil,
            created_at: nil,
            default_state_id: nil,
            description: nil,
            entity_type: nil,
            id: nil,
            name: nil,
            project_ids: [],
            states: [],
            team_id: nil,
            updated_at: nil
end
