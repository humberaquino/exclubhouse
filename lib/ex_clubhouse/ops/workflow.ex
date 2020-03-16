defmodule ExClubhouse.Ops.Workflow do
  @moduledoc """
    Workflow ops
  """

  alias ExClubhouse.Operation

  @spec list :: ExClubhouse.Operation.t()
  def list do
    %Operation{
      id: :workflow_list,
      method: :get,
      path: "workflows"
    }
  end
end
