defmodule ExClubhouse.Ops.LinkedFile do
  @moduledoc """
  Linked file ops
  """

  alias ExClubhouse.Operation
  alias ExClubhouse.Model.Input

  @spec list :: ExClubhouse.Operation.t()
  def list do
    %Operation{
      id: :linked_file_list,
      method: :get,
      path: "linked-files"
    }
  end

  @spec get(integer()) :: ExClubhouse.Operation.t()
  def get(linked_file_public_id) do
    %Operation{
      id: :linked_file_get,
      method: :get,
      path: "linked-files/#{linked_file_public_id}"
    }
  end

  @spec create(ExClubhouse.Model.Input.LinkedFile.t()) :: ExClubhouse.Operation.t()
  def create(%Input.LinkedFile{} = linked_file_input) do
    %Operation{
      id: :linked_file_create,
      method: :post,
      body: Map.from_struct(linked_file_input),
      path: "linked-files"
    }
  end

  @spec update(integer(), ExClubhouse.Model.Input.LinkedFile.t()) :: ExClubhouse.Operation.t()
  def update(linked_file_public_id, %Input.LinkedFile{} = linked_file_input) do
    %Operation{
      id: :linked_file_update,
      method: :put,
      body: Map.from_struct(linked_file_input),
      path: "linked-files/#{linked_file_public_id}"
    }
  end

  @spec delete(integer()) :: ExClubhouse.Operation.t()
  def delete(linked_file_public_id) do
    %Operation{
      id: :linked_file_delete,
      method: :delete,
      path: "linked-files/#{linked_file_public_id}"
    }
  end
end
