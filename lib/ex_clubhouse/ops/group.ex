defmodule ExClubhouse.Ops.Group do
  @moduledoc """
  Group ops
  """

  alias ExClubhouse.Operation
  alias ExClubhouse.Model.Input

  @spec list :: ExClubhouse.Operation.t()
  def list do
    %Operation{
      id: :group_list,
      method: :get,
      path: "groups"
    }
  end

  @spec get(binary()) :: ExClubhouse.Operation.t()
  def get(group_public_id) do
    %Operation{
      id: :group_get,
      method: :get,
      path: "groups/#{group_public_id}"
    }
  end

  @spec create(ExClubhouse.Model.Input.Group.t()) :: ExClubhouse.Operation.t()
  def create(%Input.Group{} = group_input) do
    %Operation{
      id: :group_create,
      method: :post,
      body: Map.from_struct(group_input),
      path: "groups"
    }
  end

  @spec update(binary(), ExClubhouse.Model.Input.Group.t()) :: ExClubhouse.Operation.t()
  def update(group_public_id, %Input.Group{} = group_input) do
    %Operation{
      id: :group_update,
      method: :put,
      body: Map.from_struct(group_input),
      path: "groups/#{group_public_id}"
    }
  end
end
