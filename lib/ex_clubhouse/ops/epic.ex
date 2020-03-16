defmodule ExClubhouse.Ops.Epic do
  @moduledoc """
  Holds builder functions for Epic operations
  """

  alias ExClubhouse.Operation
  alias ExClubhouse.Model.Input

  @spec list :: ExClubhouse.Operation.t()
  def list do
    %Operation{
      id: :epic_list,
      method: :get,
      path: "epics"
    }
  end

  @spec get(integer()) :: ExClubhouse.Operation.t()
  def get(epic_public_id) do
    %Operation{
      id: :epic_get,
      method: :get,
      path: "epics/#{epic_public_id}"
    }
  end

  @spec create(ExClubhouse.Model.Input.Epic.t()) :: ExClubhouse.Operation.t()
  def create(%Input.Epic{} = epic_input) do
    %Operation{
      id: :epic_create,
      method: :post,
      body: Map.from_struct(epic_input),
      path: "epics"
    }
  end

  @spec update(integer(), ExClubhouse.Model.Input.Epic.t()) :: ExClubhouse.Operation.t()
  def update(epic_public_id, %Input.Epic{} = epic_input) do
    %Operation{
      id: :epic_update,
      method: :put,
      body: Map.from_struct(epic_input),
      path: "epics/#{epic_public_id}"
    }
  end

  @spec delete(integer()) :: ExClubhouse.Operation.t()
  def delete(epic_public_id) do
    %Operation{
      id: :epic_delete,
      method: :delete,
      path: "epics/#{epic_public_id}"
    }
  end

  @spec comments_list(integer()) :: ExClubhouse.Operation.t()
  def comments_list(epic_public_id) do
    %Operation{
      id: :epic_comments_list,
      method: :get,
      path: "epics/#{epic_public_id}/comments"
    }
  end

  @spec create_comment(integer(), ExClubhouse.Model.Input.Comment.t()) :: ExClubhouse.Operation.t()
  def create_comment(epic_public_id, %Input.Comment{} = comment_input) do
    %Operation{
      id: :epic_create_comment,
      method: :post,
      body: Map.from_struct(comment_input),
      path: "epics/#{epic_public_id}/comments"
    }
  end

  @spec get_comment(integer(), integer()) :: ExClubhouse.Operation.t()
  def get_comment(epic_public_id, comment_public_id) do
    %Operation{
      id: :epic_get_comment,
      method: :get,
      path: "epics/#{epic_public_id}/comments/#{comment_public_id}"
    }
  end

  @spec create_comment_comment(integer(), integer(), ExClubhouse.Model.Input.Comment.t()) :: ExClubhouse.Operation.t()
  def create_comment_comment(epic_public_id, comment_public_id, %Input.Comment{} = comment_input) do
    %Operation{
      id: :epic_create_comment_comment,
      method: :post,
      body: Map.from_struct(comment_input),
      path: "epics/#{epic_public_id}/comments/#{comment_public_id}"
    }
  end

  @spec update_comment(integer(), integer(), ExClubhouse.Model.Input.UpdateComment.t()) :: ExClubhouse.Operation.t()
  def update_comment(epic_public_id, comment_public_id, %Input.UpdateComment{} = update_comment_input) do
    %Operation{
      id: :epic_update_comment,
      method: :put,
      body: Map.from_struct(update_comment_input),
      path: "epics/#{epic_public_id}/comments/#{comment_public_id}"
    }
  end

  @spec delete_comment(integer(), integer()) :: ExClubhouse.Operation.t()
  def delete_comment(epic_public_id, comment_public_id) do
    %Operation{
      id: :epic_delete_comment,
      method: :delete,
      path: "epics/#{epic_public_id}/comments/#{comment_public_id}"
    }
  end

  @spec stories_list(integer()) :: ExClubhouse.Operation.t()
  def stories_list(epic_public_id) do
    %Operation{
      id: :epic_stories_list,
      method: :get,
      path: "epics/#{epic_public_id}/stories"
    }
  end
end
