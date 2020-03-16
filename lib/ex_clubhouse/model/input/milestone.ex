defmodule ExClubhouse.Model.Input.Milestone do
  @moduledoc """
    Milestone model
  """

  alias ExClubhouse.Model

  @type t :: %__MODULE__{
          categories: list(Model.CreateCategoryParams.t()),
          completed_at_override: binary(),
          description: binary(),
          name: binary(),
          started_at_override: binary(),
          # enum: done, in progress, to do
          state: binary()
        }

  defstruct categories: nil,
            completed_at_override: nil,
            description: nil,
            name: nil,
            started_at_override: nil,
            state: nil
end
