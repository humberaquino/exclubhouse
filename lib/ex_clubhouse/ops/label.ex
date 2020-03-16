defmodule ExClubhouse.Ops.Label do
  @moduledoc """
  Label ops
  """

  alias ExClubhouse.Operation
  alias ExClubhouse.Model.Input

  @spec list :: ExClubhouse.Operation.t()
  def list do
    %Operation{
      id: :label_list,
      method: :get,
      path: "labels"
    }
  end

  @spec get(integer()) :: ExClubhouse.Operation.t()
  def get(label_public_id) do
    %Operation{
      id: :label_get,
      method: :get,
      path: "labels/#{label_public_id}"
    }
  end

  @spec create(ExClubhouse.Model.Input.Label.t()) :: ExClubhouse.Operation.t()
  def create(%Input.Label{} = label_input) do
    %Operation{
      id: :label_create,
      method: :post,
      body: Map.from_struct(label_input),
      path: "labels"
    }
  end

  @spec update(integer(), ExClubhouse.Model.Input.Label.t()) :: ExClubhouse.Operation.t()
  def update(label_public_id, %Input.Label{} = label_input) do
    %Operation{
      id: :label_update,
      method: :put,
      body: Map.from_struct(label_input),
      path: "labels/#{label_public_id}"
    }
  end

  @spec delete(integer()) :: ExClubhouse.Operation.t()
  def delete(label_public_id) do
    %Operation{
      id: :label_delete,
      method: :delete,
      path: "labels/#{label_public_id}"
    }
  end

  @spec epics_list(integer()) :: ExClubhouse.Operation.t()
  def epics_list(label_public_id) do
    %Operation{
      id: :label_epics_list,
      method: :get,
      path: "labels/#{label_public_id}/epics"
    }
  end

  @spec stories_list(integer()) :: ExClubhouse.Operation.t()
  def stories_list(label_public_id) do
    %Operation{
      id: :label_stories_list,
      method: :get,
      path: "labels/#{label_public_id}/stories"
    }
  end
end
