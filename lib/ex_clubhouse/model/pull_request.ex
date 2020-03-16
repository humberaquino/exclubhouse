defmodule ExClubhouse.Model.PullRequest do
  @moduledoc """
  Pull request model
  """

  @type t :: %__MODULE__{
          branch_id: integer(),
          branch_name: binary(),
          closed: boolean(),
          entity_type: binary(),
          id: integer(),
          num_added: integer(),
          num_commits: integer() | nil,
          num_modified: integer() | nil,
          num_removed: integer(),
          number: integer(),
          target_branch_id: integer(),
          target_branch_name: binary(),
          title: binary(),
          updated_at: binary(),
          url: binary()
        }

  defstruct branch_id: nil,
            branch_name: nil,
            closed: nil,
            entity_type: nil,
            id: nil,
            num_added: nil,
            num_commits: nil,
            num_modified: nil,
            num_removed: nil,
            number: nil,
            target_branch_id: nil,
            target_branch_name: nil,
            title: nil,
            updated_at: nil,
            url: nil
end
