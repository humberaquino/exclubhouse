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
  @spec list(binary) :: {:ok, [ExClubhouse.Model.Member.t()]} | {:error, ExClubhouse.Error.t()}
  def list(org_public_id) do
    Config.default() |> Session.from() |> list(org_public_id)
  end

  @doc """
  Get a single LinkedFile by id

  ## Example
      iex> ExClubhouse.Api.Member.get("1", "2")
      {:ok, %ExClubhouse.Model.Member{...}}
  """
  @spec get(binary, binary) :: {:ok, ExClubhouse.Model.Member.t() | nil} | {:error, ExClubhouse.Error.t()}
  def get(org_public_id, member_public_id) do
    Config.default() |> Session.from() |> get(org_public_id, member_public_id)
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

  @spec get(ExClubhouse.Session.t(), binary(), binary()) :: {:ok, [ExClubhouse.Model.Member.t()]} | {:error, ExClubhouse.Error.t()}
  def get(%Session{} = session, org_public_id, member_public_id) do
    Ops.Member.get(org_public_id, member_public_id) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec list(ExClubhouse.Session.t(), binary()) :: {:ok, [ExClubhouse.Model.Member.t()]} | {:error, ExClubhouse.Error.t()}
  def list(%Session{} = session, org_public_id) do
    Ops.Member.list(org_public_id) |> Client.HTTP.request(session) |> Parser.parse()
  end
end
