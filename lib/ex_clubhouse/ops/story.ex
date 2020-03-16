defmodule ExClubhouse.Ops.Story do
  @moduledoc """
  Story ops
  """

  alias ExClubhouse.Operation
  alias ExClubhouse.Model.Input

  @spec get(integer()) :: ExClubhouse.Operation.t()
  def get(story_public_id) do
    %Operation{
      id: :story_get,
      method: :get,
      path: "stories/#{story_public_id}"
    }
  end

  @spec create(ExClubhouse.Model.Input.Story.t()) :: ExClubhouse.Operation.t()
  def create(%Input.Story{} = story_input) do
    %Operation{
      id: :story_create,
      method: :post,
      body: Map.from_struct(story_input),
      path: "stories"
    }
  end

  @spec update(integer(), ExClubhouse.Model.Input.Story.t()) :: ExClubhouse.Operation.t()
  def update(story_public_id, %Input.Story{} = story_input) do
    %Operation{
      id: :story_update,
      method: :put,
      body: Map.from_struct(story_input),
      path: "stories/#{story_public_id}"
    }
  end

  @spec delete(integer()) :: ExClubhouse.Operation.t()
  def delete(story_public_id) do
    %Operation{
      id: :story_delete,
      method: :delete,
      path: "stories/#{story_public_id}"
    }
  end

  @spec create_comment(integer(), ExClubhouse.Model.Input.Comment.t()) ::
          ExClubhouse.Operation.t()
  def create_comment(story_public_id, %Input.Comment{} = comment_input) do
    %Operation{
      id: :story_create_comment,
      method: :post,
      body: Map.from_struct(comment_input),
      path: "stories/#{story_public_id}/comments"
    }
  end

  @spec get_comment(integer(), integer()) :: ExClubhouse.Operation.t()
  def get_comment(story_public_id, comment_public_id) do
    %Operation{
      id: :story_get_comment,
      method: :get,
      path: "stories/#{story_public_id}/comments/#{comment_public_id}"
    }
  end

  @spec update_comment(integer(), integer(), ExClubhouse.Model.Input.UpdateComment.t()) ::
          ExClubhouse.Operation.t()
  def update_comment(
        story_public_id,
        comment_public_id,
        %Input.UpdateComment{} = update_comment_input
      ) do
    %Operation{
      id: :story_update_comment,
      method: :post,
      body: Map.from_struct(update_comment_input),
      path: "stories/#{story_public_id}/comments/#{comment_public_id}"
    }
  end

  @spec delete_comment(integer(), integer()) :: ExClubhouse.Operation.t()
  def delete_comment(story_public_id, comment_public_id) do
    %Operation{
      id: :story_delete_comment,
      method: :delete,
      path: "stories/#{story_public_id}/comments/#{comment_public_id}"
    }
  end

  @spec create_reaction(integer(), integer(), ExClubhouse.Model.Input.Reaction.t()) ::
          ExClubhouse.Operation.t()
  def create_reaction(story_public_id, comment_public_id, %Input.Reaction{} = reaction_input) do
    %Operation{
      id: :story_create_reaction,
      method: :post,
      body: Map.from_struct(reaction_input),
      path: "stories/#{story_public_id}/comments/#{comment_public_id}/reactions"
    }
  end

  @spec delete_reaction(integer(), integer()) :: ExClubhouse.Operation.t()
  def delete_reaction(story_public_id, comment_public_id) do
    %Operation{
      id: :story_delete_reaction,
      method: :delete,
      path: "stories/#{story_public_id}/comments/#{comment_public_id}/reactions"
    }
  end

  @spec create_task(integer(), ExClubhouse.Model.Input.Task.t()) :: ExClubhouse.Operation.t()
  def create_task(story_public_id, %Input.Task{} = task_input) do
    %Operation{
      id: :story_create_task,
      method: :post,
      body: Map.from_struct(task_input),
      path: "stories/#{story_public_id}/tasks"
    }
  end

  @spec get_task(integer(), integer()) :: ExClubhouse.Operation.t()
  def get_task(story_public_id, task_public_id) do
    %Operation{
      id: :story_get_task,
      method: :get,
      path: "stories/#{story_public_id}/tasks/#{task_public_id}"
    }
  end

  @spec update_task(integer(), integer(), ExClubhouse.Model.Input.UpdateTask.t()) ::
          ExClubhouse.Operation.t()
  def update_task(
        story_public_id,
        task_public_id,
        %Input.UpdateTask{} = update_task_input
      ) do
    %Operation{
      id: :story_update_task,
      method: :post,
      body: Map.from_struct(update_task_input),
      path: "stories/#{story_public_id}/tasks/#{task_public_id}"
    }
  end

  @spec delete_task(integer(), integer()) :: ExClubhouse.Operation.t()
  def delete_task(story_public_id, task_public_id) do
    %Operation{
      id: :story_delete_task,
      method: :delete,
      path: "stories/#{story_public_id}/tasks/#{task_public_id}"
    }
  end
end
