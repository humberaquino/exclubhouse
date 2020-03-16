defmodule ExClubhouse.Model.Team do
  @moduledoc """
    Team model
  """

  alias ExClubhouse.Model

  @type t :: %__MODULE__{
          created_at: binary(),
          description: binary(),
          entity_type: binary(),
          id: binary(),
          name: binary(),
          position: integer(),
          projects_ids: list(integer()),
          updated_at: binary(),
          workflow: Model.Workflow.t()
        }

  defstruct created_at: nil,
            description: nil,
            entity_type: nil,
            id: nil,
            name: nil,
            position: nil,
            projects_ids: [],
            updated_at: nil,
            workflow: nil
end
