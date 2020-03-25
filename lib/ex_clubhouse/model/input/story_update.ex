defmodule ExClubhouse.Model.Input.StoryUpdate do
  @moduledoc """
  Story update input model
  """

  alias ExClubhouse.Model

  @type t :: %__MODULE__{
          after_id: integer(),
          archived: boolean(),
          before_id: integer(),
          branch_ids: list(integer()),
          commit_ids: list(integer()),
          completed_at_override: binary(),
          deadline: binary(),
          description: binary(),
          epic_id: integer() | nil,
          estimate: integer() | nil,
          file_ids: list(integer()),
          follower_ids: list(binary()),
          iteration_id: integer() | nil,
          labels: list(Model.CreateLabelParams.t()),
          linked_file_ids: list(integer()),
          name: binary(),
          owner_ids: list(binary()),
          project_id: integer(),
          pull_request_ids: list(integer()),
          requested_by_id: binary(),
          started_at_override: binary(),
          story_type: binary(),
          workflow_state_id: integer()
        }

  defstruct after_id: nil,
            archived: nil,
            before_id: nil,
            branch_ids: [],
            commit_ids: [],
            completed_at_override: nil,
            deadline: nil,
            description: nil,
            epic_id: nil,
            estimate: nil,
            file_ids: [],
            follower_ids: [],
            iteration_id: nil,
            labels: [],
            linked_file_ids: [],
            name: nil,
            owner_ids: [],
            project_id: nil,
            pull_request_ids: [],
            requested_by_id: nil,
            started_at_override: nil,
            story_type: nil,
            workflow_state_id: nil
end
