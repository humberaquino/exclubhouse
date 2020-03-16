defmodule ExClubhouse.Api.Milestone do
  @moduledoc """
  milestone API
  """

  alias ExClubhouse.Ops
  alias ExClubhouse.{Client, Session, Config}
  alias ExClubhouse.Parse.Parser
  alias ExClubhouse.Model.Input

  ##############################################
  ### Default config based utility functions ###
  ##############################################

  @doc """
  Lists all milestones

  ## Example
      iex> ExClubhouse.Api.Milestone.list()
      {:ok, [%ExClubhouse.Model.Milestone{...}, ...]}
  """
  @spec list :: {:ok, [ExClubhouse.Model.Milestone.t()]} | {:error, ExClubhouse.Error.t()}
  def list do
    Config.default() |> Session.from() |> list()
  end

  @doc """
  Get a single milestone by id

  ## Example
      iex> ExClubhouse.Api.Milestone.get(1)
      {:ok, %ExClubhouse.Model.Milestone{...}}
  """
  @spec get(integer) :: {:ok, nil | ExClubhouse.Model.Milestone.t()} | {:error, ExClubhouse.Error.t()}
  def get(milestone_public_id) do
    Config.default() |> Session.from() |> get(milestone_public_id)
  end

  @doc """
  Create a milestone

  ## Example
      iex> ExClubhouse.Api.Milestone.create(ExClubhouse.Model.Input.Milestone{...})
      {:ok, %ExClubhouse.Milestone.Group{...}}
  """
  @spec create(ExClubhouse.Model.Input.Milestone.t()) :: {:ok, ExClubhouse.Model.Milestone.t()} | {:error, ExClubhouse.Error.t()}
  def create(%Input.Milestone{} = milestone_input) do
    Config.default() |> Session.from() |> create(milestone_input)
  end

  @doc """
  Update a milestone

  ## Example
      iex> ExClubhouse.Api.Milestone.update(1, ExClubhouse.Model.Input.Milestone{...})
      {:ok, %ExClubhouse.Model.Milestone{...}}
  """
  @spec update(integer, ExClubhouse.Model.Input.Milestone.t()) :: {:ok, ExClubhouse.Model.Milestone.t()} | {:error, ExClubhouse.Error.t()}
  def update(milestone_public_id, %Input.Milestone{} = milestone_input) do
    Config.default() |> Session.from() |> update(milestone_public_id, milestone_input)
  end

  @doc """
   Delete a milestone

   ## Example
      iex> ExClubhouse.Api.Milestone.delete(1)
      :ok
  """
  @spec delete(integer) :: :ok | {:error, ExClubhouse.Error.t()}
  def delete(milestone_public_id) do
    Config.default() |> Session.from() |> delete(milestone_public_id)
  end

  @doc """
  Lists all milestone epics

  ## Example
      iex> ExClubhouse.Api.Milestone.list()
      {:ok, [%ExClubhouse.Model.EpicSlim{...}, ...]}
  """
  @spec epic_list(integer) :: {:ok, [ExClubhouse.Model.EpicSlim.t()]} | {:error, ExClubhouse.Error.t()}
  def epic_list(milestone_public_id) do
    Config.default() |> Session.from() |> epic_list(milestone_public_id)
  end

  ##################################
  ### Session specific functions ###
  ##################################

  @spec list(ExClubhouse.Session.t()) :: {:ok, [ExClubhouse.Model.Milestone.t()]} | {:error, ExClubhouse.Error.t()}
  def list(%Session{} = sess) do
    Ops.Milestone.list() |> Client.HTTP.request(sess) |> Parser.parse()
  end

  @spec get(ExClubhouse.Session.t(), integer()) :: {:ok, ExClubhouse.Model.Milestone.t() | nil} | {:error, ExClubhouse.Error.t()}
  def get(%Session{} = session, milestone_public_id) do
    Ops.Milestone.get(milestone_public_id) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec create(ExClubhouse.Session.t(), ExClubhouse.Model.Input.Milestone.t()) ::
          {:ok, ExClubhouse.Model.Milestone.t()} | {:error, ExClubhouse.Error.t()}
  def create(%Session{} = session, %Input.Milestone{} = milestone_input) do
    Ops.Milestone.create(milestone_input) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec update(ExClubhouse.Session.t(), integer(), ExClubhouse.Model.Input.Milestone.t()) ::
          {:ok, ExClubhouse.Model.Milestone.t()} | {:error, ExClubhouse.Error.t()}
  def update(%Session{} = session, milestone_public_id, %Input.Milestone{} = milestone_input) do
    Ops.Milestone.update(milestone_public_id, milestone_input)
    |> Client.HTTP.request(session)
    |> Parser.parse()
  end

  @spec delete(ExClubhouse.Session.t(), integer) :: :ok | {:error, ExClubhouse.Error.t()}
  def delete(%Session{} = session, milestone_public_id) do
    Ops.Milestone.delete(milestone_public_id) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec epic_list(ExClubhouse.Session.t(), integer()) :: {:ok, [ExClubhouse.Model.EpicSlim.t()]} | {:error, ExClubhouse.Error.t()}
  def epic_list(%Session{} = session, milestone_public_id) do
    Ops.Milestone.epic_list(milestone_public_id) |> Client.HTTP.request(session) |> Parser.parse()
  end
end
