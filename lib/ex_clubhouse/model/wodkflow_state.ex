defmodule ExClubhouse.Model.WorkflowState do
  @moduledoc """
  Workflow state model
  """

  @type t :: %__MODULE__{
          color: binary(),
          created_at: binary(),
          description: binary(),
          entity_state: binary(),
          id: integer(),
          name: binary(),
          num_stories: integer(),
          num_story_templates: integer(),
          position: integer(),
          type: binary(),
          updated_at: binary(),
          verb: binary() | nil
        }

  defstruct color: nil,
            created_at: nil,
            description: nil,
            entity_state: nil,
            id: nil,
            name: nil,
            num_stories: nil,
            num_story_templates: nil,
            position: nil,
            type: nil,
            updated_at: nil,
            verb: nil
end
