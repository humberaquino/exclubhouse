defmodule ExClubhouse.Model.CreateStoryContents do
  @moduledoc """
  Story content input
  """

  alias ExClubhouse.Model

  @type t :: %__MODULE__{
          deadline: binary() | nil,
          description: binary(),
          entity_type: binary(),
          epic_id: integer() | nil,
          estimate: integer() | nil,
          external_tickets: list(Model.CreateEntityTemplateExternalTicket.t()),
          file_ids: list(integer()),
          files: list(Model.File.t()),
          follower_ids: list(binary()),
          iteration_id: binary(),
          labels: list(Model.CreateLabelParams.t()),
          linked_files: list(Model.LinkedFile.t()),
          name: binary(),
          owner_ids: list(binary()),
          project_id: integer(),
          story_type: binary(),
          tasks: list(Model.EmptyTemplateTask.t()),
          workflow_state_id: integer()
        }

  defstruct deadline: nil,
            description: nil,
            entity_type: nil,
            epic_id: nil,
            estimate: nil,
            external_tickets: [],
            file_ids: [],
            files: [],
            follower_ids: [],
            iteration_id: nil,
            labels: [],
            linked_file_ids: [],
            linked_files: [],
            name: nil,
            owner_ids: [],
            project_id: nil,
            story_type: nil,
            tasks: [],
            workflow_state_id: nil
end
