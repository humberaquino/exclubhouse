defmodule ExClubhouse.Model.IterationSlim do
  @moduledoc """
  Iteration slim model
  """

  alias ExClubhouse.Model

  @type t :: %__MODULE__{
          app_url: binary(),
          created_at: binary(),
          end_date: binary(),
          entity_type: binary(),
          follower_ids: list(binary()),
          group_ids: list(binary()),
          group_mention_ids: list(binary()),
          id: integer(),
          labels: list(Model.Label.t()),
          member_mention_ids: list(binary()),
          mention_ids: list(binary()),
          name: binary(),
          start_date: binary(),
          stats: Model.IterationStats.t(),
          status: binary(),
          updated_at: binary()
        }

  defstruct app_url: nil,
            created_at: nil,
            end_date: nil,
            entity_type: nil,
            follower_ids: [],
            group_ids: [],
            group_mention_ids: [],
            id: nil,
            labels: [],
            member_mention_ids: [],
            mention_ids: [],
            name: nil,
            start_date: nil,
            stats: nil,
            status: nil,
            updated_at: nil
end
