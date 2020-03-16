defmodule ExClubhouse.Api.Team do
  @moduledoc """
  Team API
  """

  alias ExClubhouse.Ops
  alias ExClubhouse.{Client, Session, Config}
  alias ExClubhouse.Parse.Parser

  ##############################################
  ### Default config based utility functions ###
  ##############################################

  @doc """
  Lists all teams

  ## Example
      iex> ExClubhouse.Api.Team.list()
      {:ok, [%ExClubhouse.Model.Team{...}, ...]}
  """
  @spec list :: {:ok, [ExClubhouse.Model.Team.t()]} | {:error, ExClubhouse.Error.t()}
  def list do
    Config.default() |> Session.from() |> list()
  end

  @doc """
  Get a single team by id

  ## Example
      iex> ExClubhouse.Api.Team.get(1)
      {:ok, %ExClubhouse.Model.Team{...}}
  """
  @spec get(integer) :: {:ok, nil | ExClubhouse.Model.Team.t()} | {:error, ExClubhouse.Error.t()}
  def get(team_public_id) do
    Config.default() |> Session.from() |> get(team_public_id)
  end

  ##################################
  ### Session specific functions ###
  ##################################

  @spec list(ExClubhouse.Session.t()) :: {:ok, [ExClubhouse.Model.Team.t()]} | {:error, ExClubhouse.Error.t()}
  def list(%Session{} = sess) do
    Ops.Team.list() |> Client.HTTP.request(sess) |> Parser.parse()
  end

  @spec get(ExClubhouse.Session.t(), integer()) :: {:ok, ExClubhouse.Model.Team.t() | nil} | {:error, ExClubhouse.Error.t()}
  def get(%Session{} = session, team_public_id) do
    Ops.Team.get(team_public_id) |> Client.HTTP.request(session) |> Parser.parse()
  end
end
