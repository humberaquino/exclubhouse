defmodule ExClubhouse.Api.Story do
  @moduledoc """
  Story api
  """

  alias ExClubhouse.Ops
  alias ExClubhouse.{Client, Session, Config}
  alias ExClubhouse.Parse.Parser
  alias ExClubhouse.Model.Input

  ##############################################
  ### Default config based utility functions ###
  ##############################################

  @doc """
  Get a single Story by id

  ## Example
      iex> ExClubhouse.Api.Story.get(1)
      {:ok, %ExClubhouse.Model.Story{...}}
  """
  @spec get(integer) :: {:error, ExClubhouse.Error.t()} | {:ok, nil | ExClubhouse.Model.Story.t()}
  def get(story_public_id) do
    Config.default() |> Session.from() |> get(story_public_id)
  end

  @doc """
  Create a Story

  ## Example
      iex> ExClubhouse.Api.Story.create(ExClubhouse.Model.Input.Story{...})
      {:ok, %ExClubhouse.Model.Story{...}}
  """
  @spec create(ExClubhouse.Model.Input.Story.t()) :: {:error, ExClubhouse.Error.t()} | {:ok, ExClubhouse.Model.Story.t()}
  def create(%Input.Story{} = story_input) do
    Config.default() |> Session.from() |> create(story_input)
  end

  @doc """
  Update a Story

  ## Example
      iex> ExClubhouse.Api.Story.update(1, ExClubhouse.Model.Input.Story{...})
      {:ok, %ExClubhouse.Model.Story{...}}
  """
  @spec update(integer, ExClubhouse.Model.Input.StoryUpdate.t()) :: {:error, ExClubhouse.Error.t()} | {:ok, ExClubhouse.Model.Story.t()}
  def update(story_public_id, %Input.StoryUpdate{} = story_update_input) do
    Config.default() |> Session.from() |> update(story_public_id, story_update_input)
  end

  @doc """
   Delete a Story

   ## Example
      iex> ExClubhouse.Api.Story.delete(1)
      :ok
  """
  @spec delete(integer) :: :ok | {:error, ExClubhouse.Error.t()}
  def delete(story_public_id) do
    Config.default() |> Session.from() |> delete(story_public_id)
  end

  @doc """
  Create a comment within a story

  ## Example
      iex> ExClubhouse.Api.Story.create_comment(1, ExClubhouse.Model.Input.Comment{...})
      {:ok, %ExClubhouse.Model.Comment{...}}
  """
  @spec create_comment(integer, ExClubhouse.Model.Input.Comment.t()) :: {:error, ExClubhouse.Error.t()} | {:ok, ExClubhouse.Model.Comment.t()}
  def create_comment(story_public_id, %Input.Comment{} = input_comment) do
    Config.default() |> Session.from() |> create_comment(story_public_id, input_comment)
  end

  @doc """
  Get a single comment

  ## Example
      iex> ExClubhouse.Api.Story.get_comment(1, 2)
      {:ok, %ExClubhouse.Model.Comment{...}}
  """
  @spec get_comment(integer, integer) :: {:error, ExClubhouse.Error.t()} | {:ok, nil | ExClubhouse.Model.Comment.t()}
  def get_comment(story_public_id, comment_public_id) do
    Config.default() |> Session.from() |> get_comment(story_public_id, comment_public_id)
  end

  @doc """
  Update a comment

  ## Example
      iex> ExClubhouse.Api.Story.update_comment(1, 2, ExClubhouse.Model.Input.UpdateComment{...})
      {:ok, %ExClubhouse.Model.Comment{...}}
  """
  @spec update_comment(integer, integer, ExClubhouse.Model.Input.UpdateComment.t()) ::
          {:error, ExClubhouse.Error.t()} | {:ok, ExClubhouse.Model.Comment.t()}
  def update_comment(
        story_public_id,
        comment_public_id,
        %Input.UpdateComment{} = update_comment_input
      ) do
    Config.default()
    |> Session.from()
    |> update_comment(story_public_id, comment_public_id, update_comment_input)
  end

  @doc """
   Delete a comment

   ## Example
      iex> ExClubhouse.Api.Story.delete_comment(1, 2)
      :ok
  """
  @spec delete_comment(integer, integer) :: :ok | {:error, ExClubhouse.Error.t()}
  def delete_comment(story_public_id, comment_public_id) do
    Config.default() |> Session.from() |> delete_comment(story_public_id, comment_public_id)
  end

  @doc """
  Create a comment reaction

  ## Example
      iex> ExClubhouse.Api.Story.create_reaction(1,2, ExClubhouse.Model.Input.Reaction{...})
      {:ok, %ExClubhouse.Model.Reaction{...}}
  """
  @spec create_reaction(integer, integer, ExClubhouse.Model.Input.Reaction.t()) ::
          {:error, ExClubhouse.Error.t()} | {:ok, ExClubhouse.Model.Reaction.t()}
  def create_reaction(
        story_public_id,
        comment_public_id,
        %Input.Reaction{} = input_reaction
      ) do
    Config.default()
    |> Session.from()
    |> create_reaction(story_public_id, comment_public_id, input_reaction)
  end

  @doc """
   Delete a reaction

   ## Example
      iex> ExClubhouse.Api.Story.delete_reaction(1, 2)
      :ok
  """
  @spec delete_reaction(integer, integer) :: :ok | {:error, ExClubhouse.Error.t()}
  def delete_reaction(story_public_id, comment_public_id) do
    Config.default() |> Session.from() |> delete_reaction(story_public_id, comment_public_id)
  end

  @doc """
  Create a story task

  ## Example
      iex> ExClubhouse.Api.Story.create_task(ExClubhouse.Model.Input.Task{...})
      {:ok, %ExClubhouse.Model.Task{...}}
  """
  @spec create_task(integer, ExClubhouse.Model.Input.Task.t()) :: {:error, ExClubhouse.Error.t()} | {:ok, ExClubhouse.Model.Task.t()}
  def create_task(story_public_id, %Input.Task{} = input_task) do
    Config.default() |> Session.from() |> create_task(story_public_id, input_task)
  end

  @doc """
  Get a single task by id

  ## Example
      iex> ExClubhouse.Api.Story.get_task(1, 2)
      {:ok, %ExClubhouse.Model.Task{...}}
  """
  @spec get_task(integer, integer) :: {:error, ExClubhouse.Error.t()} | {:ok, nil | ExClubhouse.Model.Task.t()}
  def get_task(story_public_id, task_public_id) do
    Config.default()
    |> Session.from()
    |> get_task(story_public_id, task_public_id)
  end

  @doc """
  Update a task

  ## Example
      iex> ExClubhouse.Api.Story.update_task(1, 2, ExClubhouse.Model.Input.UpdateTask{...})
      {:ok, %ExClubhouse.Model.Task{...}}
  """
  @spec update_task(integer, integer, ExClubhouse.Model.Input.UpdateTask.t()) :: {:error, ExClubhouse.Error.t()} | {:ok, ExClubhouse.Model.Task.t()}
  def update_task(
        story_public_id,
        task_public_id,
        %Input.UpdateTask{} = update_task_input
      ) do
    Config.default()
    |> Session.from()
    |> update_task(story_public_id, task_public_id, update_task_input)
  end

  @doc """
   Delete a task

   ## Example
      iex> ExClubhouse.Api.Story.delete_task(1)
      :ok
  """
  @spec delete_task(integer, integer) :: :ok | {:error, ExClubhouse.Error.t()}
  def delete_task(story_public_id, task_public_id) do
    Config.default() |> Session.from() |> delete_task(story_public_id, task_public_id)
  end

  ##################################
  ### Session specific functions ###
  ##################################

  @spec get(ExClubhouse.Session.t(), integer()) :: {:ok, ExClubhouse.Model.Story.t() | nil} | {:error, ExClubhouse.Error.t()}
  def get(%Session{} = session, story_public_id) do
    Ops.Story.get(story_public_id) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec create(ExClubhouse.Session.t(), ExClubhouse.Model.Input.Story.t()) ::
          {:ok, ExClubhouse.Model.Story.t()} | {:error, ExClubhouse.Error.t()}
  def create(%Session{} = sess, %Input.Story{} = story_input) do
    Ops.Story.create(story_input) |> Client.HTTP.request(sess) |> Parser.parse()
  end

  @spec update(ExClubhouse.Session.t(), integer(), ExClubhouse.Model.Input.StoryUpdate.t()) ::
          {:ok, ExClubhouse.Model.Story.t()} | {:error, ExClubhouse.Error.t()}
  def update(%Session{} = session, story_public_id, %Input.StoryUpdate{} = story_update_input) do
    Ops.Story.update(story_public_id, story_update_input)
    |> Client.HTTP.request(session)
    |> Parser.parse()
  end

  @spec delete(ExClubhouse.Session.t(), integer) :: :ok | {:error, ExClubhouse.Error.t()}
  def delete(%Session{} = session, story_public_id) do
    Ops.Story.delete(story_public_id) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec create_comment(ExClubhouse.Session.t(), integer(), ExClubhouse.Model.Input.Comment.t()) ::
          {:ok, ExClubhouse.Model.Comment.t()} | {:error, ExClubhouse.Error.t()}
  def create_comment(%Session{} = session, story_public_id, %Input.Comment{} = input_comment) do
    Ops.Story.create_comment(story_public_id, input_comment)
    |> Client.HTTP.request(session)
    |> Parser.parse()
  end

  @spec get_comment(ExClubhouse.Session.t(), integer(), integer()) :: {:ok, ExClubhouse.Model.Comment.t() | nil} | {:error, ExClubhouse.Error.t()}
  def get_comment(%Session{} = session, story_public_id, comment_public_id) do
    Ops.Story.get_comment(story_public_id, comment_public_id)
    |> Client.HTTP.request(session)
    |> Parser.parse()
  end

  @spec update_comment(ExClubhouse.Session.t(), integer(), integer(), ExClubhouse.Model.Input.UpdateComment.t()) ::
          {:ok, ExClubhouse.Model.Comment.t()} | {:error, ExClubhouse.Error.t()}
  def update_comment(
        %Session{} = session,
        story_public_id,
        comment_public_id,
        %Input.UpdateComment{} = update_comment_input
      ) do
    Ops.Story.update_comment(story_public_id, comment_public_id, update_comment_input)
    |> Client.HTTP.request(session)
    |> Parser.parse()
  end

  @spec delete_comment(ExClubhouse.Session.t(), integer(), integer()) :: :ok | {:error, ExClubhouse.Error.t()}
  def delete_comment(%Session{} = session, story_public_id, comment_public_id) do
    Ops.Story.delete_comment(story_public_id, comment_public_id)
    |> Client.HTTP.request(session)
    |> Parser.parse()
  end

  @spec create_reaction(ExClubhouse.Session.t(), integer(), integer(), ExClubhouse.Model.Input.Reaction.t()) ::
          {:ok, ExClubhouse.Model.Reaction.t()} | {:error, ExClubhouse.Error.t()}
  def create_reaction(
        %Session{} = session,
        story_public_id,
        comment_public_id,
        %Input.Reaction{} = input_reaction
      ) do
    Ops.Story.create_reaction(story_public_id, comment_public_id, input_reaction)
    |> Client.HTTP.request(session)
    |> Parser.parse()
  end

  @spec delete_reaction(ExClubhouse.Session.t(), integer(), integer()) :: :ok | {:error, ExClubhouse.Error.t()}
  def delete_reaction(%Session{} = session, story_public_id, comment_public_id) do
    Ops.Story.delete_reaction(story_public_id, comment_public_id)
    |> Client.HTTP.request(session)
    |> Parser.parse()
  end

  @spec create_task(ExClubhouse.Session.t(), integer(), ExClubhouse.Model.Input.Task.t()) ::
          {:ok, ExClubhouse.Model.Task.t()} | {:error, ExClubhouse.Error.t()}
  def create_task(%Session{} = session, story_public_id, %Input.Task{} = input_task) do
    Ops.Story.create_task(story_public_id, input_task)
    |> Client.HTTP.request(session)
    |> Parser.parse()
  end

  @spec get_task(ExClubhouse.Session.t(), integer(), integer()) :: {:ok, ExClubhouse.Model.Task.t() | nil} | {:error, ExClubhouse.Error.t()}
  def get_task(%Session{} = session, story_public_id, task_public_id) do
    Ops.Story.get_task(story_public_id, task_public_id)
    |> Client.HTTP.request(session)
    |> Parser.parse()
  end

  @spec update_task(ExClubhouse.Session.t(), integer(), integer(), ExClubhouse.Model.Input.UpdateTask.t()) ::
          {:ok, ExClubhouse.Model.Task.t()} | {:error, ExClubhouse.Error.t()}
  def update_task(
        %Session{} = session,
        story_public_id,
        task_public_id,
        %Input.UpdateTask{} = update_task_input
      ) do
    Ops.Story.update_task(story_public_id, task_public_id, update_task_input)
    |> Client.HTTP.request(session)
    |> Parser.parse()
  end

  @spec delete_task(ExClubhouse.Session.t(), integer(), integer()) :: :ok | {:error, ExClubhouse.Error.t()}
  def delete_task(%Session{} = session, story_public_id, task_public_id) do
    Ops.Story.delete_task(story_public_id, task_public_id)
    |> Client.HTTP.request(session)
    |> Parser.parse()
  end
end
