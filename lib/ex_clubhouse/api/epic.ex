defmodule ExClubhouse.Api.Epic do
  @moduledoc """
  Epic API
  """

  alias ExClubhouse.Ops
  alias ExClubhouse.{Client, Session, Config}
  alias ExClubhouse.Parse.Parser
  alias ExClubhouse.Model.Input
  ##############################################
  ### Default config based utility functions ###
  ##############################################

  @doc """
  Lists all epics

  ## Example
      iex> ExClubhouse.Api.Epic.list()
      {:ok, [%ExClubhouse.Model.EpicSlim{...}, ...]}
  """
  @spec list :: {:ok, [ExClubhouse.Model.EpicSlim.t()]} | {:error, ExClubhouse.Error.t()}
  def list do
    Config.default() |> Session.from() |> list()
  end

  @doc """
  Get a single Epic by id

  ## Example
      iex> ExClubhouse.Api.Epic.get(1)
      {:ok, %ExClubhouse.Model.Epic{...}}
  """
  @spec get(integer) :: {:ok, nil | ExClubhouse.Model.Epic.t()} | {:error, ExClubhouse.Error.t()}
  def get(category_public_id) do
    Config.default() |> Session.from() |> get(category_public_id)
  end

  @doc """
  Create an Epic

  ## Example
      iex> ExClubhouse.Api.Epic.create(ExClubhouse.Model.Input.Epic{...})
      {:ok, %ExClubhouse.Model.Epic{...}}
  """
  @spec create(ExClubhouse.Model.Input.Epic.t()) :: {:ok, ExClubhouse.Model.Epic.t()} | {:error, ExClubhouse.Error.t()}
  def create(%Input.Epic{} = epic_input) do
    Config.default() |> Session.from() |> create(epic_input)
  end

  @doc """
  Update an Epic

  ## Example
      iex> ExClubhouse.Api.Epic.update(1, ExClubhouse.Model.Input.Epic{...})
      {:ok, %ExClubhouse.Model.Epic{...}}
  """
  @spec update(integer, ExClubhouse.Model.Input.Epic.t()) :: {:ok, ExClubhouse.Model.Epic.t()} | {:error, ExClubhouse.Error.t()}
  def update(epic_public_id, %Input.Epic{} = epic_input) do
    Config.default() |> Session.from() |> update(epic_public_id, epic_input)
  end

  @doc """
   Delete an Epic

   ## Example
      iex> ExClubhouse.Api.Epic.delete(1)
      :ok
  """
  @spec delete(integer) :: :ok | {:error, ExClubhouse.Error.t()}
  def delete(epic_public_id) do
    Config.default() |> Session.from() |> delete(epic_public_id)
  end

  @doc """
  Lists all Epic comments

  ## Example
      iex> ExClubhouse.Api.Epic.comments_list(1)
      {:ok, [%ExClubhouse.Model.ThreadedComment{...}, ...]}
  """
  @spec comments_list(integer) :: {:ok, [ExClubhouse.Model.ThreadedComment.t()]} | {:error, ExClubhouse.Error.t()}
  def comments_list(epic_public_id) do
    Config.default() |> Session.from() |> comments_list(epic_public_id)
  end

  @doc """
  Create an Epic comment

  ## Example
      iex> ExClubhouse.Api.Epic.create(1, ExClubhouse.Model.Input.Comment{...})
      {:ok, %ExClubhouse.Model.ThreadedComment{...}}
  """
  @spec create_comment(integer(), ExClubhouse.Model.Input.Comment.t()) ::
          {:ok, ExClubhouse.Model.ThreadedComment.t()} | {:error, ExClubhouse.Error.t()}
  def create_comment(epic_public_id, %Input.Comment{} = comment_input) do
    Config.default() |> Session.from() |> create_comment(epic_public_id, comment_input)
  end

  @doc """
  Get a single Epic by id

  ## Example
      iex> ExClubhouse.Api.Epic.get_comment(1, 2)
      {:ok, %ExClubhouse.Model.ThreadedComment{...}}
  """
  @spec get_comment(integer(), integer()) :: {:ok, ExClubhouse.Model.ThreadedComment.t() | nil} | {:error, ExClubhouse.Error.t()}
  def get_comment(epic_public_id, comment_public_id) do
    Config.default() |> Session.from() |> get_comment(epic_public_id, comment_public_id)
  end

  @spec create_comment_comment(integer(), integer(), ExClubhouse.Model.Input.Comment.t()) ::
          {:ok, ExClubhouse.Model.ThreadedComment.t()} | {:error, ExClubhouse.Error.t()}
  def create_comment_comment(epic_public_id, comment_public_id, %Input.Comment{} = comment_input) do
    Config.default() |> Session.from() |> create_comment_comment(epic_public_id, comment_public_id, comment_input)
  end

  @doc """
  Update an Epic comment

  ## Example
      iex> ExClubhouse.Api.Epic.update_comment(1, 2, ExClubhouse.Model.Input.UpdateComment{...})
      {:ok, %ExClubhouse.Model.Epic{...}}
  """
  @spec update_comment(integer(), integer(), ExClubhouse.Model.Input.UpdateComment.t()) ::
          {:ok, ExClubhouse.Model.ThreadedComment.t()} | {:error, ExClubhouse.Error.t()}
  def update_comment(epic_public_id, comment_public_id, %Input.UpdateComment{} = update_comment_input) do
    Config.default() |> Session.from() |> update_comment(epic_public_id, comment_public_id, update_comment_input)
  end

  @doc """
   Delete a comment

   ## Example
      iex> ExClubhouse.Api.Epic.delete_comment(1, 2)
      :ok
  """
  @spec delete_comment(integer, integer()) :: :ok | {:error, ExClubhouse.Error.t()}
  def delete_comment(epic_public_id, comment_public_id) do
    Config.default() |> Session.from() |> delete_comment(epic_public_id, comment_public_id)
  end

  @doc """
  Lists all stories from an epic

  ## Example
      iex> ExClubhouse.Api.Epic.stories_list(1)
      {:ok, [%ExClubhouse.Model.EpicSlim{...}, ...]}
  """
  @spec stories_list(integer()) :: {:ok, [ExClubhouse.Model.StorySlim.t()]} | {:error, ExClubhouse.Error.t()}
  def stories_list(epic_public_id) do
    Config.default() |> Session.from() |> stories_list(epic_public_id)
  end

  ##################################
  ### Session specific functions ###
  ##################################

  @spec list(ExClubhouse.Session.t()) :: {:ok, [ExClubhouse.Model.EpicSlim.t()]} | {:error, ExClubhouse.Error.t()}
  def list(%Session{} = sess) do
    Ops.Epic.list() |> Client.HTTP.request(sess) |> Parser.parse()
  end

  @spec get(ExClubhouse.Session.t(), integer()) :: {:ok, ExClubhouse.Model.Epic.t() | nil} | {:error, ExClubhouse.Error.t()}
  def get(%Session{} = session, epic_public_id) do
    Ops.Epic.get(epic_public_id) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec create(ExClubhouse.Session.t(), ExClubhouse.Model.Input.Epic.t()) ::
          {:ok, ExClubhouse.Model.Epic.t()} | {:error, ExClubhouse.Error.t()}
  def create(%Session{} = session, %Input.Epic{} = epic_input) do
    Ops.Epic.create(epic_input) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec update(ExClubhouse.Session.t(), integer(), ExClubhouse.Model.Input.Epic.t()) ::
          {:ok, ExClubhouse.Model.Epic.t()} | {:error, ExClubhouse.Error.t()}
  def update(%Session{} = session, epic_public_id, %Input.Epic{} = epic_input) do
    Ops.Epic.update(epic_public_id, epic_input) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec delete(ExClubhouse.Session.t(), integer) :: :ok | {:error, ExClubhouse.Error.t()}
  def delete(%Session{} = session, epic_public_id) do
    Ops.Epic.delete(epic_public_id) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec comments_list(ExClubhouse.Session.t(), integer()) :: {:ok, [ExClubhouse.Model.ThreadedComment.t()]} | {:error, ExClubhouse.Error.t()}
  def comments_list(%Session{} = sess, epic_public_id) do
    Ops.Epic.comments_list(epic_public_id) |> Client.HTTP.request(sess) |> Parser.parse()
  end

  @spec create_comment(ExClubhouse.Session.t(), integer(), ExClubhouse.Model.Input.Comment.t()) ::
          {:ok, ExClubhouse.Model.ThreadedComment.t()} | {:error, ExClubhouse.Error.t()}
  def create_comment(%Session{} = session, epic_public_id, %Input.Comment{} = comment_input) do
    Ops.Epic.create_comment(epic_public_id, comment_input) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec get_comment(ExClubhouse.Session.t(), integer(), integer()) :: {:ok, ExClubhouse.Model.Epic.t() | nil} | {:error, ExClubhouse.Error.t()}
  def get_comment(%Session{} = session, epic_public_id, comment_public_id) do
    Ops.Epic.get_comment(epic_public_id, comment_public_id) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec create_comment_comment(ExClubhouse.Session.t(), integer(), integer(), ExClubhouse.Model.Input.Comment.t()) ::
          {:ok, ExClubhouse.Model.ThreadedComment.t()} | {:error, ExClubhouse.Error.t()}
  def create_comment_comment(%Session{} = session, epic_public_id, comment_public_id, %Input.Comment{} = comment_input) do
    Ops.Epic.create_comment_comment(epic_public_id, comment_public_id, comment_input) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec update_comment(ExClubhouse.Session.t(), integer(), integer(), ExClubhouse.Model.Input.UpdateComment.t()) ::
          {:ok, ExClubhouse.Model.Epic.t()} | {:error, ExClubhouse.Error.t()}
  def update_comment(%Session{} = session, epic_public_id, comment_public_id, %Input.UpdateComment{} = update_comment_input) do
    Ops.Epic.update_comment(epic_public_id, comment_public_id, update_comment_input) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec delete_comment(ExClubhouse.Session.t(), integer, integer()) :: :ok | {:error, ExClubhouse.Error.t()}
  def delete_comment(%Session{} = session, epic_public_id, comment_public_id) do
    Ops.Epic.delete_comment(epic_public_id, comment_public_id) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec stories_list(ExClubhouse.Session.t(), integer()) :: {:ok, [ExClubhouse.Model.StorySlim.t()]} | {:error, ExClubhouse.Error.t()}
  def stories_list(%Session{} = sess, epic_public_id) do
    Ops.Epic.stories_list(epic_public_id) |> Client.HTTP.request(sess) |> Parser.parse()
  end
end
