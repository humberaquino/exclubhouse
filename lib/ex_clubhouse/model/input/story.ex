defmodule ExClubhouse.Model.Input.Story do
  @moduledoc """
  Story input model
  """

  alias ExClubhouse.Model

  @type t :: %__MODULE__{
          archived: boolean(),
          comments: list(Model.CreateStoryCommentParams.t()),
          completed_at_override: binary(),
          created_at: binary(),
          deadline: binary(),
          description: binary(),
          epic_id: integer() | nil,
          estimate: integer() | nil,
          external_id: binary(),
          external_tickets: list(Model.CreateExternalTicketParams.t()),
          file_ids: list(integer()),
          follower_ids: list(binary()),
          iteration_id: integer() | nil,
          labels: list(Model.CreateLabelParams.t()),
          linked_file_ids: list(integer()),
          name: binary(),
          owner_ids: list(binary()),
          project_id: integer(),
          requested_by_id: binary(),
          started_at_override: binary(),
          story_links: list(Model.CreateStoryLinkParams.t()),
          story_type: binary(),
          tasks: list(Model.CreateTaskParams.t()),
          updated_at: binary(),
          workflow_state_id: integer()
        }

  defstruct archived: nil,
            comments: nil,
            completed_at_override: nil,
            created_at: nil,
            deadline: nil,
            description: nil,
            epic_id: nil,
            estimate: nil,
            external_id: nil,
            external_tickets: [],
            file_ids: [],
            follower_ids: [],
            iteration_id: nil,
            labels: [],
            linked_file_ids: [],
            name: nil,
            owner_ids: [],
            project_id: nil,
            requested_by_id: nil,
            started_at_override: nil,
            story_links: [],
            story_type: nil,
            tasks: [],
            updated_at: nil,
            workflow_state_id: nil
end
