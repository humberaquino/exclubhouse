defmodule ExClubhouse.Model.Input.Project do
  @moduledoc """
  Project input model
  """

  @type t :: %__MODULE__{
          abbreviation: binary() | nil,
          color: binary() | nil,
          created_at: binary() | nil,
          description: binary() | nil,
          external_id: binary() | nil,
          follower_ids: list(binary()) | nil,
          iteration_length: integer() | nil,
          name: binary(),
          start_time: binary() | nil,
          team_id: integer(),
          updated_at: binary() | nil
        }

  defstruct abbreviation: nil,
            color: nil,
            created_at: nil,
            description: nil,
            external_id: nil,
            follower_ids: [],
            iteration_length: nil,
            name: nil,
            start_time: nil,
            team_id: nil,
            updated_at: nil
end
