defmodule ExClubhouse.Ops.Iteration do
  @moduledoc """
  Iteration ops
  """

  alias ExClubhouse.Operation
  alias ExClubhouse.Model.Input

  @spec list :: ExClubhouse.Operation.t()
  def list do
    %Operation{
      id: :iteration_list,
      method: :get,
      path: "iterations"
    }
  end

  @spec get(integer()) :: ExClubhouse.Operation.t()
  def get(iteration_public_id) do
    %Operation{
      id: :iteration_get,
      method: :get,
      path: "iterations/#{iteration_public_id}"
    }
  end

  @spec create(ExClubhouse.Model.Input.Iteration.t()) :: ExClubhouse.Operation.t()
  def create(%Input.Iteration{} = iteration_input) do
    %Operation{
      id: :iteration_create,
      method: :post,
      body: Map.from_struct(iteration_input),
      path: "iterations"
    }
  end

  @spec update(integer(), ExClubhouse.Model.Input.Iteration.t()) :: ExClubhouse.Operation.t()
  def update(iteration_public_id, %Input.Iteration{} = iteration_input) do
    %Operation{
      id: :iteration_update,
      method: :put,
      body: Map.from_struct(iteration_input),
      path: "iterations/#{iteration_public_id}"
    }
  end

  @spec delete(integer()) :: ExClubhouse.Operation.t()
  def delete(iteration_public_id) do
    %Operation{
      id: :iteration_delete,
      method: :delete,
      path: "iterations/#{iteration_public_id}"
    }
  end

  @spec disable :: ExClubhouse.Operation.t()
  def disable do
    %Operation{
      id: :iteration_disable,
      method: :put,
      path: "iterations/disable"
    }
  end

  @spec enable :: ExClubhouse.Operation.t()
  def enable do
    %Operation{
      id: :iteration_enable,
      method: :put,
      path: "iterations/enable"
    }
  end

  @spec stories_list(integer()) :: ExClubhouse.Operation.t()
  def stories_list(iteration_public_id) do
    %Operation{
      id: :iteration_stories_list,
      method: :get,
      path: "iterations/#{iteration_public_id}/stories"
    }
  end
end
