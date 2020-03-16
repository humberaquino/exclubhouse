defmodule ExClubhouse.Model.Input.Epic do
  @moduledoc """
  Epic input model used to create and update
  """

  alias ExClubhouse.Model

  @type t :: %__MODULE__{
          completed_at_override: binary(),
          created_at: binary(),
          deadline: binary() | nil,
          description: binary() | nil,
          epic_state_id: integer(),
          external_id: binary(),
          follower_ids: list(binary()),
          labels: list(Model.CreateLabelParams.t()),
          milestone_id: integer() | nil,
          name: binary(),
          owner_ids: list(binary()),
          planned_start_date: binary() | nil,
          requested_by_id: binary(),
          started_at_override: binary(),
          state: binary(),
          updated_at: binary()
        }

  defstruct completed_at_override: nil,
            created_at: nil,
            deadline: nil,
            description: nil,
            epic_state_id: nil,
            external_id: nil,
            follower_ids: [],
            labels: [],
            milestone_id: nil,
            name: nil,
            owner_ids: [],
            planned_start_date: nil,
            requested_by_id: nil,
            started_at_override: nil,
            state: nil,
            updated_at: nil
end
