defmodule ExClubhouse.Model.Milestone do
  @moduledoc """
  Milestone response model
  """

  alias ExClubhouse.Model

  @type t :: %__MODULE__{
          app_url: binary(),
          categories: list(Model.Category.t()),
          completed: boolean(),
          completed_at: binary() | nil,
          completed_at_override: binary() | nil,
          created_at: binary() | nil,
          description: binary(),
          entity_type: binary(),
          id: integer(),
          name: binary(),
          position: integer(),
          started: boolean(),
          started_at: binary() | nil,
          started_at_override: binary() | nil,
          state: binary(),
          stats: Model.MilestoneStats.t(),
          updated_at: binary() | nil
        }

  defstruct app_url: nil,
            categories: [],
            completed: true,
            completed_at: nil,
            completed_at_override: nil,
            created_at: nil,
            description: nil,
            entity_type: nil,
            id: nil,
            name: nil,
            position: nil,
            started: true,
            started_at: nil,
            started_at_override: nil,
            state: nil,
            stats: nil,
            updated_at: nil
end
