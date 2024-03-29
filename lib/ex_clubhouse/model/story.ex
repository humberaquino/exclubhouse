defmodule ExClubhouse.Model.Story do
  @moduledoc """
  Story model
  """

  alias ExClubhouse.Model

  @type t :: %__MODULE__{
          app_url: binary(),
          archived: boolean(),
          blocked: boolean(),
          blocker: boolean(),
          branches: list(Model.Branch.t()),
          comments: list(Model.Comment.t()),
          commits: list(Model.Commit.t()),
          completed: boolean(),
          completed_at: binary() | nil,
          completed_at_override: binary() | nil,
          created_at: binary(),
          cycle_time: integer(),
          deadline: binary() | nil,
          description: binary(),
          entity_type: binary(),
          epic_id: integer() | nil,
          estimate: integer() | nil,
          external_id: binary() | nil,
          external_tickets: list(Model.ExternalTicket.t()),
          files: list(Model.File.t()),
          follower_ids: list(binary()),
          group_mention_ids: list(binary()),
          id: integer(),
          iteration_id: integer() | nil,
          labels: list(Model.Label.t()),
          linked_files: list(Model.LinkedFile.t()),
          member_mention_ids: list(binary()),
          mention_ids: list(binary()),
          moved_at: binary() | nil,
          name: binary(),
          owner_ids: list(binary()),
          position: integer(),
          previous_iteration_ids: list(integer()),
          project_id: integer(),
          pull_requests: list(Model.PullRequest.t()),
          requested_by_id: binary(),
          started: binary() | nil,
          started_at: binary() | nil,
          started_at_override: binary() | nil,
          stats: Model.StoryStats.t(),
          story_links: list(Model.TypedStoryLink.t()),
          story_type: binary(),
          tasks: list(Model.Task.t()),
          updated_at: binary() | nil,
          workflow_state_id: integer()
        }

  defstruct app_url: nil,
            archived: nil,
            blocked: nil,
            blocker: nil,
            branches: [],
            comments: [],
            commits: [],
            completed: nil,
            completed_at: nil,
            completed_at_override: nil,
            created_at: nil,
            cycle_time: nil,
            deadline: nil,
            description: nil,
            entity_type: nil,
            epic_id: nil,
            estimate: nil,
            external_id: nil,
            external_tickets: [],
            files: [],
            follower_ids: [],
            group_mention_ids: [],
            id: nil,
            iteration_id: nil,
            labels: [],
            linked_files: [],
            member_mention_ids: [],
            mention_ids: [],
            moved_at: nil,
            name: nil,
            owner_ids: [],
            position: nil,
            previous_iteration_ids: [],
            project_id: nil,
            pull_requests: [],
            requested_by_id: nil,
            started: nil,
            started_at: nil,
            started_at_override: nil,
            stats: nil,
            story_links: [],
            story_type: nil,
            tasks: [],
            updated_at: nil,
            workflow_state_id: nil
end
