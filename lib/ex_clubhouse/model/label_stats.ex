defmodule ExClubhouse.Model.LabelStats do
  @moduledoc """
  LabelStats response model
  """

  @type t :: %__MODULE__{
          num_epics: integer(),
          num_points_completed: integer(),
          num_points_in_progress: integer(),
          num_points_total: integer(),
          num_related_documents: integer(),
          num_stories_completed: integer(),
          num_stories_in_progress: integer(),
          num_stories_total: integer(),
          num_stories_unestimated: integer()
        }

  defstruct num_epics: nil,
            num_points_completed: nil,
            num_points_in_progress: nil,
            num_points_total: nil,
            num_related_documents: nil,
            num_stories_completed: nil,
            num_stories_in_progress: nil,
            num_stories_total: nil,
            num_stories_unestimated: nil
end
