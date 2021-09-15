defmodule ExClubhouse.Api.Member do
  @moduledoc """
    Member Api
  """

  alias ExClubhouse.Ops
  alias ExClubhouse.{Client, Session, Config}
  alias ExClubhouse.Parse.Parser

  ##############################################
  ### Default config based utility functions ###
  ##############################################

  @doc """
  Gets the current member info

  ## Example
      iex> ExClubhouse.Api.Member.current_member_info()
      {:ok, %ExClubhouse.Model.MemberInfo{...}}
  """
  @spec current_member_info :: {:ok, ExClubhouse.Model.MemberInfo.t()} | {:error, ExClubhouse.Error.t()}
  def current_member_info do
    Config.default() |> Session.from() |> current_member_info()
  end

  @doc """
  Lists all members

  ## Example
      iex> ExClubhouse.Api.Member.list()
      {:ok, [%ExClubhouse.Model.Member{...}, ...]}
  """
  @spec list() :: {:ok, [ExClubhouse.Model.Member.t()]} | {:error, ExClubhouse.Error.t()}
  def list do
    Config.default() |> Session.from() |> list()
  end

  @doc """
  Get a single Member by id

  ## Example
      iex> ExClubhouse.Api.Member.get("1")
      {:ok, %ExClubhouse.Model.Member{...}}
  """
  @spec get(binary) :: {:ok, ExClubhouse.Model.Member.t() | nil} | {:error, ExClubhouse.Error.t()}
  def get(member_public_id) do
    Config.default() |> Session.from() |> get(member_public_id)
  end

  ##################################
  ### Session specific functions ###
  ##################################

  @spec current_member_info(ExClubhouse.Session.t()) :: {:ok, [ExClubhouse.Model.MemberInfo.t()]} | {:error, ExClubhouse.Error.t()}
  def current_member_info(%Session{} = session) do
    Ops.Member.current_member_info()
    |> Client.HTTP.request(session)
    |> Parser.parse()
  end

  @spec get(ExClubhouse.Session.t(), binary()) :: {:ok, [ExClubhouse.Model.Member.t()]} | {:error, ExClubhouse.Error.t()}
  def get(%Session{} = session, member_public_id) do
    Ops.Member.get(member_public_id) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec list(ExClubhouse.Session.t()) :: {:ok, [ExClubhouse.Model.Member.t()]} | {:error, ExClubhouse.Error.t()}
  def list(%Session{} = session) do
    Ops.Member.list() |> Client.HTTP.request(session) |> Parser.parse()
  end
end
