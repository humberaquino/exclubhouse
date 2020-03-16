defmodule ExClubhouse.Ops.Milestone do
  @moduledoc """
    Milestone op
  """

  alias ExClubhouse.Operation
  alias ExClubhouse.Model.Input

  @spec list :: ExClubhouse.Operation.t()
  def list do
    %Operation{
      id: :milestone_list,
      method: :get,
      path: "milestones"
    }
  end

  @spec get(integer()) :: ExClubhouse.Operation.t()
  def get(milestone_public_id) do
    %Operation{
      id: :milestone_get,
      method: :get,
      path: "milestones/#{milestone_public_id}"
    }
  end

  @spec create(ExClubhouse.Model.Input.Milestone.t()) :: ExClubhouse.Operation.t()
  def create(%Input.Milestone{} = milestone_input) do
    %Operation{
      id: :milestone_create,
      method: :post,
      body: Map.from_struct(milestone_input),
      path: "milestones"
    }
  end

  @spec update(integer(), ExClubhouse.Model.Input.Milestone.t()) :: ExClubhouse.Operation.t()
  def update(milestone_public_id, %Input.Milestone{} = milestone_input) do
    %Operation{
      id: :milestone_update,
      method: :put,
      body: Map.from_struct(milestone_input),
      path: "milestones/#{milestone_public_id}"
    }
  end

  @spec delete(integer()) :: ExClubhouse.Operation.t()
  def delete(milestone_public_id) do
    %Operation{
      id: :milestone_delete,
      method: :delete,
      path: "milestones/#{milestone_public_id}"
    }
  end

  @spec epic_list(integer()) :: ExClubhouse.Operation.t()
  def epic_list(milestone_public_id) do
    %Operation{
      id: :milestone_epic_list,
      method: :get,
      path: "milestones/#{milestone_public_id}/epics"
    }
  end
end
