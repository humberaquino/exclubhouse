defmodule ExClubhouse.Model.Project do
  @moduledoc """
    Project model
  """

  alias ExClubhouse.Model

  @type t :: %__MODULE__{
          abbreviation: binary() | nil,
          app_url: binary(),
          archived: boolean(),
          color: binary() | nil,
          created_at: binary() | nil,
          days_to_thermometer: integer(),
          description: binary() | nil,
          entity_type: binary(),
          external_id: binary() | nil,
          follower_ids: list(binary()),
          id: integer(),
          iteration_length: integer(),
          name: binary(),
          show_thermometer: boolean(),
          start_time: binary(),
          stats: Model.ProjectStats.t(),
          team_id: integer(),
          updated_at: binary() | nil
        }

  defstruct abbreviation: nil,
            app_url: nil,
            archived: true,
            color: nil,
            created_at: nil,
            days_to_thermometer: nil,
            description: nil,
            entity_type: nil,
            external_id: nil,
            follower_ids: [],
            id: nil,
            iteration_length: nil,
            name: nil,
            show_thermometer: nil,
            start_time: nil,
            stats: nil,
            team_id: nil,
            updated_at: nil
end
