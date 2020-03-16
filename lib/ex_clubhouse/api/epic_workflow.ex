defmodule ExClubhouse.Api.EpicWorkflow do
  @moduledoc """
  Epic workflow API
  """

  alias ExClubhouse.Ops
  alias ExClubhouse.{Client, Session, Config}
  alias ExClubhouse.Parse.Parser

  ##############################################
  ### Default config based utility functions ###
  ##############################################

  @doc """
  Get the epic workflow

  ## Example
      iex> ExClubhouse.Api.EpicWorkflow.get()
      {:ok, %ExClubhouse.Model.EpicWorkflow{...}}
  """
  @spec get :: {:ok, ExClubhouse.Model.EpicWorkflow.t()} | {:error, ExClubhouse.Error.t()}
  def get do
    Config.default() |> Session.from() |> get()
  end

  ##################################
  ### Session specific functions ###
  ##################################

  @spec get(ExClubhouse.Session.t()) :: {:ok, ExClubhouse.Model.EpicWorkflow.t()} | {:error, ExClubhouse.Error.t()}
  def get(%Session{} = sess) do
    Ops.EpicWorkflow.get() |> Client.HTTP.request(sess) |> Parser.parse()
  end
end
