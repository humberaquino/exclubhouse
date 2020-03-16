defmodule ExClubhouse.Model.EpicStats do
  @moduledoc """
  EpicStats response model
  """

  @type t :: %__MODULE__{
          average_cycle_time: integer(),
          average_lead_time: integer(),
          last_story_update: binary() | nil,
          num_points: integer(),
          num_points_done: integer(),
          num_points_started: integer(),
          num_points_unstarted: integer(),
          num_related_documents: integer(),
          num_stories_done: integer(),
          num_stories_started: integer(),
          num_stories_unestimated: integer(),
          num_stories_unstarted: integer()
        }

  defstruct average_cycle_time: nil,
            average_lead_time: nil,
            last_story_update: nil,
            num_points: nil,
            num_points_done: nil,
            num_points_started: nil,
            num_points_unstarted: nil,
            num_related_documents: nil,
            num_stories_done: nil,
            num_stories_started: nil,
            num_stories_unestimated: nil,
            num_stories_unstarted: nil
end
