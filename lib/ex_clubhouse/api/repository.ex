defmodule ExClubhouse.Api.Repository do
  @moduledoc """
  Repository API
  """

  alias ExClubhouse.Ops
  alias ExClubhouse.{Client, Session, Config}
  alias ExClubhouse.Parse.Parser

  ##############################################
  ### Default config based utility functions ###
  ##############################################

  @doc """
  Lists all Repository

  ## Example
      iex> ExClubhouse.Api.Repository.list()
      {:ok, [%ExClubhouse.Model.Repository{...}, ...]}
  """
  @spec list :: {:ok, [ExClubhouse.Model.Repository.t()]} | {:error, ExClubhouse.Error.t()}
  def list do
    Config.default() |> Session.from() |> list()
  end

  @doc """
  Get a single Repository by id

  ## Example
      iex> ExClubhouse.Api.Repository.get(1)
      {:ok, %ExClubhouse.Model.Repository{...}}
  """
  @spec get(integer) :: {:ok, nil | ExClubhouse.Model.Repository.t()} | {:error, ExClubhouse.Error.t()}
  def get(repository_public_id) do
    Config.default() |> Session.from() |> get(repository_public_id)
  end

  ##################################
  ### Session specific functions ###
  ##################################

  @spec list(ExClubhouse.Session.t()) :: {:ok, [ExClubhouse.Model.Repository.t()]} | {:error, ExClubhouse.Error.t()}
  def list(%Session{} = sess) do
    Ops.Repository.list() |> Client.HTTP.request(sess) |> Parser.parse()
  end

  @spec get(ExClubhouse.Session.t(), integer()) :: {:ok, ExClubhouse.Model.Repository.t() | nil} | {:error, ExClubhouse.Error.t()}
  def get(%Session{} = session, repository_public_id) do
    Ops.Repository.get(repository_public_id) |> Client.HTTP.request(session) |> Parser.parse()
  end
end
