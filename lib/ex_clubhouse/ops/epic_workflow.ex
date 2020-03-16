defmodule ExClubhouse.Ops.EpicWorkflow do
  @moduledoc """
  Epic workflow ops
  """

  alias ExClubhouse.Operation

  @spec get :: ExClubhouse.Operation.t()
  def get() do
    %Operation{
      id: :epic_workflow_get,
      method: :get,
      path: "epic-workflow"
    }
  end
end
