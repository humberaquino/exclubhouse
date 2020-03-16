defmodule ExClubhouse.Api.Project do
  @moduledoc """
    Project API
  """

  alias ExClubhouse.Ops
  alias ExClubhouse.{Client, Session, Config}
  alias ExClubhouse.Parse.Parser
  alias ExClubhouse.Model.Input

  ##############################################
  ### Default config based utility functions ###
  ##############################################

  @doc """
  Lists all Project

  ## Example
      iex> ExClubhouse.Api.Project.list()
      {:ok, [%ExClubhouse.Model.Project{...}, ...]}
  """
  @spec list :: {:ok, [ExClubhouse.Model.Project.t()]} | {:error, ExClubhouse.Error.t()}
  def list do
    Config.default() |> Session.from() |> list()
  end

  @doc """
  Get a single project by id

  ## Example
      iex> ExClubhouse.Api.Project.get(1)
      {:ok, %ExClubhouse.Model.Project{...}}
  """
  @spec get(integer) :: {:ok, nil | ExClubhouse.Model.Project.t()} | {:error, ExClubhouse.Error.t()}
  def get(project_public_id) do
    Config.default() |> Session.from() |> get(project_public_id)
  end

  @doc """
  Create a Project

  ## Example
      iex> ExClubhouse.Api.Project.create(ExClubhouse.Model.Input.Project{...})
      {:ok, %ExClubhouse.Model.Project{...}}
  """
  @spec create(ExClubhouse.Model.Input.Project.t()) :: {:ok, ExClubhouse.Model.Project.t()} | {:error, ExClubhouse.Error.t()}
  def create(%Input.Project{} = project_input) do
    Config.default() |> Session.from() |> create(project_input)
  end

  @doc """
  Update a Project

  ## Example
      iex> ExClubhouse.Api.Project.update(1, ExClubhouse.Model.Input.Project{...})
      {:ok, %ExClubhouse.Model.Project{...}}
  """
  @spec update(integer, ExClubhouse.Model.Input.Project.t()) :: {:ok, ExClubhouse.Model.Project.t()} | {:error, ExClubhouse.Error.t()}
  def update(project_public_id, %Input.Project{} = project_input) do
    Config.default() |> Session.from() |> update(project_public_id, project_input)
  end

  @doc """
   Delete a Project

   ## Example
      iex> ExClubhouse.Api.Project.delete(1)
      :ok
  """
  @spec delete(integer) :: :ok | {:error, ExClubhouse.Error.t()}
  def delete(project_public_id) do
    Config.default() |> Session.from() |> delete(project_public_id)
  end

  @doc """
  Lists all project's stories

  ## Example
      iex> ExClubhouse.Api.Project.story_list()
      {:ok, [%ExClubhouse.Model.StorySlim{...}, ...]}
  """
  @spec story_list(integer) :: {:ok, [ExClubhouse.Model.StorySlim.t()]} | {:error, ExClubhouse.Error.t()}
  def story_list(project_public_id) do
    Config.default() |> Session.from() |> story_list(project_public_id)
  end

  ##################################
  ### Session specific functions ###
  ##################################

  @spec list(ExClubhouse.Session.t()) :: {:ok, [ExClubhouse.Model.Project.t()]} | {:error, ExClubhouse.Error.t()}
  def list(%Session{} = sess) do
    Ops.Project.list() |> Client.HTTP.request(sess) |> Parser.parse()
  end

  @spec get(ExClubhouse.Session.t(), integer()) :: {:ok, ExClubhouse.Model.Project.t() | nil} | {:error, ExClubhouse.Error.t()}
  def get(%Session{} = session, project_public_id) do
    Ops.Project.get(project_public_id) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec create(ExClubhouse.Session.t(), ExClubhouse.Model.Input.Project.t()) ::
          {:ok, ExClubhouse.Model.Project.t()} | {:error, ExClubhouse.Error.t()}
  def create(%Session{} = session, %Input.Project{} = project_input) do
    Ops.Project.create(project_input) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec update(ExClubhouse.Session.t(), integer(), ExClubhouse.Model.Input.Project.t()) ::
          {:ok, ExClubhouse.Model.Project.t()} | {:error, ExClubhouse.Error.t()}
  def update(%Session{} = session, project_public_id, %Input.Project{} = project_input) do
    Ops.Project.update(project_public_id, project_input)
    |> Client.HTTP.request(session)
    |> Parser.parse()
  end

  @spec delete(ExClubhouse.Session.t(), integer) :: :ok | {:error, ExClubhouse.Error.t()}
  def delete(%Session{} = session, project_public_id) do
    Ops.Project.delete(project_public_id) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec story_list(ExClubhouse.Session.t(), integer()) :: {:ok, [ExClubhouse.Model.StorySlim.t()]} | {:error, ExClubhouse.Error.t()}
  def story_list(%Session{} = session, project_public_id) do
    Ops.Project.story_list(project_public_id) |> Client.HTTP.request(session) |> Parser.parse()
  end
end
