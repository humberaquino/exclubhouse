defmodule ExClubhouse.Api.Workflow do
  @moduledoc """
  Workflow api
  """

  alias ExClubhouse.Ops
  alias ExClubhouse.{Client, Session, Config}
  alias ExClubhouse.Parse.Parser

  ##############################################
  ### Default config based utility functions ###
  ##############################################

  @doc """
  Lists all workflows

  ## Example
      iex> ExClubhouse.Api.Workflow.list()
      {:ok, [%ExClubhouse.Model.Workflow{...}, ...]}
  """
  @spec list :: {:ok, [ExClubhouse.Model.Workflow.t()]} | {:error, ExClubhouse.Error.t()}
  def list do
    Config.default() |> Session.from() |> list()
  end

  ##################################
  ### Session specific functions ###
  ##################################

  @spec list(ExClubhouse.Session.t()) :: {:ok, [ExClubhouse.Model.Workflow.t()]} | {:error, ExClubhouse.Error.t()}
  def list(%Session{} = sess) do
    Ops.Workflow.list() |> Client.HTTP.request(sess) |> Parser.parse()
  end
end
