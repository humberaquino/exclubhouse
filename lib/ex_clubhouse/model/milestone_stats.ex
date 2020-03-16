defmodule ExClubhouse.Model.MilestoneStats do
  @moduledoc """
  Milestone stats response model
  """

  @type t :: %__MODULE__{
          average_cycle_time: integer(),
          average_lead_time: integer(),
          num_related_documents: integer()
        }

  defstruct average_cycle_time: nil, average_lead_time: nil, num_related_documents: nil
end
