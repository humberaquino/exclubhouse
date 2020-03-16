defmodule ExClubhouse.Api.Group do
  @moduledoc """
  Simple interface to the Group API
  """

  alias ExClubhouse.Ops
  alias ExClubhouse.{Client, Session, Config}
  alias ExClubhouse.Parse.Parser
  alias ExClubhouse.Model.Input

  ##############################################
  ### Default config based utility functions ###
  ##############################################

  @doc """
  Lists all groups

  ## Example
      iex> ExClubhouse.Api.Group.list()
      {:ok, [%ExClubhouse.Model.Group{...}, ...]}
  """
  @spec list :: {:ok, [ExClubhouse.Model.Group.t()]} | {:error, ExClubhouse.Error.t()}
  def list do
    Config.default() |> Session.from() |> list()
  end

  @doc """
  Get a single group by id

  ## Example
      iex> ExClubhouse.Api.Group.get(1)
      {:ok, %ExClubhouse.Model.Group{...}}
  """
  @spec get(binary) :: {:ok, nil | ExClubhouse.Model.Group.t()} | {:error, ExClubhouse.Error.t()}
  def get(group_public_id) do
    Config.default() |> Session.from() |> get(group_public_id)
  end

  @doc """
  Create a group

  ## Example
      iex> ExClubhouse.Api.Group.update(ExClubhouse.Model.Input.Group{...})
      {:ok, %ExClubhouse.Model.Group{...}}
  """
  @spec create(ExClubhouse.Model.Input.Group.t()) :: {:ok, ExClubhouse.Model.Group.t()} | {:error, ExClubhouse.Error.t()}
  def create(%Input.Group{} = group_input) do
    Config.default() |> Session.from() |> create(group_input)
  end

  @doc """
  Update a group

  ## Example
      iex> ExClubhouse.Api.File.upfate(ExClubhouse.Model.Input.Group{...})
      {:ok, %ExClubhouse.Model.Group{...}}
  """
  @spec update(binary, ExClubhouse.Model.Input.Group.t()) :: {:ok, ExClubhouse.Model.Group.t()} | {:error, ExClubhouse.Error.t()}
  def update(group_public_id, %Input.Group{} = group_input) do
    Config.default() |> Session.from() |> update(group_public_id, group_input)
  end

  ##################################
  ### Session specific functions ###
  ##################################

  @spec list(ExClubhouse.Session.t()) :: {:ok, [ExClubhouse.Model.Group.t()]} | {:error, ExClubhouse.Error.t()}
  def list(%Session{} = sess) do
    Ops.Group.list() |> Client.HTTP.request(sess) |> Parser.parse()
  end

  @spec get(ExClubhouse.Session.t(), binary()) :: {:ok, ExClubhouse.Model.Group.t() | nil} | {:error, ExClubhouse.Error.t()}
  def get(%Session{} = session, group_public_id) do
    Ops.Group.get(group_public_id) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec create(ExClubhouse.Session.t(), ExClubhouse.Model.Input.Group.t()) :: {:ok, ExClubhouse.Model.Group.t()} | {:error, ExClubhouse.Error.t()}
  def create(%Session{} = session, %Input.Group{} = group_input) do
    Ops.Group.create(group_input) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec update(ExClubhouse.Session.t(), binary(), ExClubhouse.Model.Input.Group.t()) ::
          {:ok, ExClubhouse.Model.Group.t()} | {:error, ExClubhouse.Error.t()}
  def update(%Session{} = session, group_public_id, %Input.Group{} = group_input) do
    Ops.Group.update(group_public_id, group_input)
    |> Client.HTTP.request(session)
    |> Parser.parse()
  end
end
