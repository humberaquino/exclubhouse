defmodule ExClubhouse.Parse.Rules do
  @moduledoc """
  Parse rules used to decode json responses into structs
  """

  alias ExClubhouse.Model

  # Mappings
  @epic_state_mapping %Model.EpicState{}
  @file_mapping %Model.File{}
  @group_mapping %Model.Group{}
  @iteration_stats_mapping %Model.IterationStats{}
  @epic_stats_mapping %Model.EpicStats{}
  @stats_mapping %Model.EpicStats{}
  @support_ticket_mapping %Model.SupportTicket{}
  @threaded_comment_mapping %Model.ThreadedComment{}
  @category_mapping %Model.Category{}
  @milestone_stats_mapping %Model.MilestoneStats{}
  @external_ticket_mapping %Model.ExternalTicket{}
  @linked_file_mapping %Model.LinkedFile{}
  @story_contents_task_mapping %Model.StoryContentsTask{}
  @basic_workspace_info %Model.BasicWorkspaceInfo{}
  @icon_mapping %Model.Icon{}
  @story_link_mapping %Model.StoryLink{}
  @story_stats_mapping %Model.StoryStats{}
  @project_stats_mapping %Model.ProjectStats{}
  @repository_mapping %Model.Repository{}
  @workflow_state_mapping %Model.WorkflowState{}
  @story_link_mapping %Model.StoryLink{}
  @pull_request_mapping %Model.PullRequest{}
  @typed_story_link_mapping %Model.TypedStoryLink{}
  @task_mapping %Model.Task{}
  @comment_mapping %Model.Comment{}
  @reaction_mapping %Model.Reaction{}

  @label_mapping %Model.Label{
    stats: %Model.LabelStats{}
  }

  @milestone_mapping %Model.Milestone{
    categories: [@category_mapping],
    stats: @milestone_stats_mapping
  }

  @epic_slim_mapping %Model.EpicSlim{
    stats: @stats_mapping,
    external_tickets: [@support_ticket_mapping],
    labels: [@label_mapping]
  }

  @epic_mapping %Model.Epic{
    stats: @epic_stats_mapping,
    external_tickets: [@support_ticket_mapping],
    labels: [@label_mapping],
    comments: [@threaded_comment_mapping]
  }

  @story_content_mapping %Model.StoryContent{
    external_tickets: [@external_ticket_mapping],
    labels: [@label_mapping],
    linked_files: [@linked_file_mapping],
    tasks: [@story_contents_task_mapping]
  }

  @entity_template_mapping %Model.EntityTemplate{
    story_contents: @story_content_mapping
  }

  @epic_workflow_mapping %Model.EpicWorkflow{
    epic_states: [@epic_state_mapping]
  }

  @iteration_slim_mapping %Model.IterationSlim{
    labels: [@label_mapping],
    stats: @iteration_stats_mapping
  }

  @iteration_mapping %Model.Iteration{
    labels: [@label_mapping],
    stats: @iteration_stats_mapping
  }

  @story_slim_mapping %Model.StorySlim{
    external_tickets: [@external_ticket_mapping],
    labels: [@label_mapping],
    stats: @story_stats_mapping,
    story_links: [@story_link_mapping]
  }

  @member_info_mapping %Model.MemberInfo{
    workspace2: @basic_workspace_info
  }

  @profile_mapping %Model.Profile{
    display_icon: @icon_mapping
  }

  @member_mapping %Model.Member{
    profile: @profile_mapping
  }

  @project_mapping %Model.Project{
    stats: @project_stats_mapping
  }

  @workflow_mapping %Model.Workflow{
    states: [@workflow_state_mapping]
  }

  @team_mapping %Model.Team{
    workflow: @workflow_mapping
  }

  @branch_mapping %Model.Branch{
    pull_requests: [%Model.PullRequest{}]
  }
  @commit_mapping %Model.Commit{
    author_identity: %Model.Identity{}
  }

  @epic_search_results_mapping %Model.EpicSearchResults{
    data: [@epic_mapping]
  }

  @story_mapping %Model.Story{
    branches: [@branch_mapping],
    comments: [@comment_mapping],
    commits: [@commit_mapping],
    external_tickets: [@external_ticket_mapping],
    files: [@file_mapping],
    labels: [@label_mapping],
    linked_files: [@linked_file_mapping],
    pull_requests: [@pull_request_mapping],
    stats: @story_stats_mapping,
    story_links: [@typed_story_link_mapping],
    tasks: [@task_mapping]
  }

  @stories_search_results_mapping %Model.StorySearchResults{
    data: [@story_mapping]
  }

  @search_results_mapping %Model.SearchResults{
    epics: @epic_search_results_mapping,
    stories: @stories_search_results_mapping
  }

  @decode_map %{
    epic_list: [@epic_slim_mapping],
    epic_get: @epic_mapping,
    epic_create: @epic_mapping,
    epic_update: @epic_mapping,
    epic_comments_list: [@threaded_comment_mapping],
    epic_create_comment: @comment_mapping,
    epic_get_comment: @comment_mapping,
    epic_create_comment_comment: @comment_mapping,
    epic_update_comment: @comment_mapping,
    epic_stories_list: [@story_slim_mapping],
    category_list: [@category_mapping],
    category_get: @category_mapping,
    category_create: @category_mapping,
    category_update: @category_mapping,
    category_milestone_list: [@milestone_mapping],
    entity_template_list: [@entity_template_mapping],
    entity_template_create: @entity_template_mapping,
    entity_template_update: @entity_template_mapping,
    entity_template_get: @entity_template_mapping,
    epic_workflow_get: @epic_workflow_mapping,
    file_list: [@file_mapping],
    file_get: @file_mapping,
    file_update: @file_mapping,
    group_list: [@group_mapping],
    group_get: @group_mapping,
    group_create: @group_mapping,
    group_update: @group_mapping,
    iteration_list: [@iteration_slim_mapping],
    iteration_get: @iteration_mapping,
    iteration_create: @iteration_mapping,
    iteration_update: @iteration_mapping,
    iteration_stories_list: [@story_slim_mapping],
    label_list: [@label_mapping],
    label_get: @label_mapping,
    label_create: @label_mapping,
    label_update: @label_mapping,
    label_epics_list: [@epic_slim_mapping],
    label_stories_list: [@story_slim_mapping],
    linked_file_list: [@linked_file_mapping],
    linked_file_get: @linked_file_mapping,
    linked_file_create: @linked_file_mapping,
    linked_file_update: @linked_file_mapping,
    member_current_info_get: @member_info_mapping,
    member_get: @member_mapping,
    member_list: [@member_mapping],
    milestone_list: [@milestone_mapping],
    milestone_get: @milestone_mapping,
    milestone_create: @milestone_mapping,
    milestone_update: @milestone_mapping,
    milestone_epic_list: [@epic_slim_mapping],
    project_list: [@project_mapping],
    project_create: @project_mapping,
    project_get: @project_mapping,
    project_update: @project_mapping,
    project_milestone_list: [@story_slim_mapping],
    repository_list: [@repository_mapping],
    repository_get: @repository_mapping,
    search_search: @search_results_mapping,
    search_search_epics: @epic_search_results_mapping,
    search_search_stories: @stories_search_results_mapping,
    workflow_list: [@workflow_mapping],
    team_list: [@team_mapping],
    team_get: @team_mapping,
    story_link_get: @story_link_mapping,
    story_link_create: @story_link_mapping,
    story_link_update: @story_link_mapping,
    story_create: @story_mapping,
    story_get: @story_mapping,
    story_update: @story_mapping,
    story_create_comment: @comment_mapping,
    story_get_comment: @comment_mapping,
    story_update_comment: @comment_mapping,
    story_create_reaction: [@reaction_mapping],
    story_create_task: @task_mapping,
    story_get_task: @task_mapping,
    story_update_task: @task_mapping
  }

  def decode_map do
    @decode_map
  end
end
