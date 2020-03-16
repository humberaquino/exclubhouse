defmodule ExClubhouse.Ops.Category do
  @moduledoc """
  Holds builder functions for Category operations
  """

  alias ExClubhouse.Operation
  alias ExClubhouse.Model.Input

  @spec list :: ExClubhouse.Operation.t()
  def list do
    %Operation{
      id: :category_list,
      method: :get,
      path: "categories"
    }
  end

  @spec get(integer()) :: ExClubhouse.Operation.t()
  def get(category_public_id) do
    %Operation{
      id: :category_get,
      method: :get,
      path: "categories/#{category_public_id}"
    }
  end

  @spec create(ExClubhouse.Model.Input.Category.t()) :: ExClubhouse.Operation.t()
  def create(%Input.Category{} = category_input) do
    %Operation{
      id: :category_create,
      method: :post,
      body: Map.from_struct(category_input),
      path: "categories"
    }
  end

  @spec update(integer(), ExClubhouse.Model.Input.Category.t()) :: ExClubhouse.Operation.t()
  def update(category_public_id, %Input.Category{} = category_input) do
    %Operation{
      id: :category_update,
      method: :put,
      body: Map.from_struct(category_input),
      path: "categories/#{category_public_id}"
    }
  end

  @spec delete(integer()) :: ExClubhouse.Operation.t()
  def delete(category_public_id) do
    %Operation{
      id: :category_delete,
      method: :delete,
      path: "categories/#{category_public_id}"
    }
  end

  @spec milestone_list(integer()) :: ExClubhouse.Operation.t()
  def milestone_list(category_public_id) do
    %Operation{
      id: :category_milestone_list,
      method: :get,
      path: "categories/#{category_public_id}/milestones"
    }
  end
end
