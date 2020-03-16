defmodule ExClubhouse.Model.Input.Iteration do
  @moduledoc """
  Iteration input model
  """

  alias ExClubhouse.Model

  @type t :: %__MODULE__{
          description: binary() | nil,
          end_date: binary(),
          follower_ids: list(binary()) | nil,
          group_ids: list(boolean()) | nil,
          labels: list(Model.CreateLabelParams.t()) | nil,
          name: binary(),
          start_date: binary()
        }

  defstruct description: nil,
            end_date: nil,
            follower_ids: nil,
            group_ids: nil,
            labels: [],
            name: nil,
            start_date: nil
end
