defmodule ExClubhouse.Model.Branch do
  @moduledoc """
    Branch model
  """

  alias ExClubhouse.Model

  @type t :: %__MODULE__{
          created_at: binary() | nil,
          deleted: boolean(),
          entity_name: binary(),
          id: integer() | nil,
          merged_branch_ids: list(integer()),
          name: binary(),
          persistent: boolean(),
          pull_requests: list(Model.PullRequest.t()),
          repository_id: integer() | nil,
          updated_at: binary() | nil,
          url: binary()
        }

  defstruct created_at: nil,
            deleted: nil,
            entity_name: nil,
            id: nil,
            merged_branch_ids: [],
            name: nil,
            persistent: nil,
            pull_requests: [],
            repository_id: nil,
            updated_at: nil,
            url: nil
end
