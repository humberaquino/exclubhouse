defmodule ExClubhouse.Model.StoryContent do
  @moduledoc """
  Story content response model
  """
  alias ExClubhouse.Model

  @type t :: %__MODULE__{
          deadline: binary(),
          description: binary(),
          entity_type: binary(),
          epic_id: integer(),
          estimate: integer(),
          external_tickets: list(Model.ExternalTicket.t()),
          files: list(Model.File.t()),
          follower_ids: list(binary()),
          iteration_id: integer(),
          labels: list(Model.Label.t()),
          linked_files: list(Model.LinkedFile.t()),
          name: binary(),
          owner_ids: list(binary()),
          project_id: integer(),
          story_type: binary(),
          tasks: list(Model.StoryContentsTask.t()),
          workflow_state_id: integer()
        }

  defstruct deadline: nil,
            description: nil,
            entity_type: nil,
            epic_id: nil,
            estimate: nil,
            external_tickets: [],
            files: [],
            follower_ids: [],
            iteration_id: nil,
            labels: [],
            linked_files: [],
            name: nil,
            owner_ids: [],
            project_id: nil,
            story_type: nil,
            tasks: [],
            workflow_state_id: nil
end
