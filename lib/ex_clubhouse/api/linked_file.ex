defmodule ExClubhouse.Api.LinkedFile do
  @moduledoc """
  Linked file API
  """

  alias ExClubhouse.Ops
  alias ExClubhouse.{Client, Session, Config}
  alias ExClubhouse.Parse.Parser
  alias ExClubhouse.Model.Input

  ##############################################
  ### Default config based utility functions ###
  ##############################################

  @doc """
  Lists all LinkedFile

  ## Example
      iex> ExClubhouse.Api.LinkedFile.list()
      {:ok, [%ExClubhouse.Model.LinkedFile{...}, ...]}
  """
  @spec list :: {:ok, [ExClubhouse.Model.LinkedFile.t()]} | {:error, ExClubhouse.Error.t()}
  def list do
    Config.default() |> Session.from() |> list()
  end

  @doc """
  Get a single LinkedFile by id

  ## Example
      iex> ExClubhouse.Api.LinkedFile.get(1)
      {:ok, %ExClubhouse.Model.LinkedFile{...}}
  """
  @spec get(integer) :: {:ok, nil | ExClubhouse.Model.LinkedFile.t()} | {:error, ExClubhouse.Error.t()}
  def get(linked_file_public_id) do
    Config.default() |> Session.from() |> get(linked_file_public_id)
  end

  @doc """
  Create a LinkedFile

  ## Example
      iex> ExClubhouse.Api.LinkedFile.create(ExClubhouse.Model.Input.LinkedFile{...})
      {:ok, %ExClubhouse.Model.LinkedFile{...}}
  """
  @spec create(ExClubhouse.Model.Input.LinkedFile.t()) :: {:ok, ExClubhouse.Model.LinkedFile.t()} | {:error, ExClubhouse.Error.t()}
  def create(%Input.LinkedFile{} = linked_file_input) do
    Config.default() |> Session.from() |> create(linked_file_input)
  end

  @doc """
  Update a LinkedFile

  ## Example
      iex> ExClubhouse.Api.LinkedFile.update(1, ExClubhouse.Model.Input.LinkedFile{...})
      {:ok, %ExClubhouse.Model.LinkedFile{...}}
  """
  @spec update(integer, ExClubhouse.Model.Input.LinkedFile.t()) :: {:ok, ExClubhouse.Model.LinkedFile.t()} | {:error, ExClubhouse.Error.t()}
  def update(linked_file_public_id, %Input.LinkedFile{} = linked_file_input) do
    Config.default() |> Session.from() |> update(linked_file_public_id, linked_file_input)
  end

  @doc """
   Delete a LinkedFile

   ## Example
      iex> ExClubhouse.Api.LinkedFile.delete(1)
      :ok
  """
  @spec delete(integer) :: :ok | {:error, ExClubhouse.Error.t()}
  def delete(linked_file_public_id) do
    Config.default() |> Session.from() |> delete(linked_file_public_id)
  end

  ##################################
  ### Session specific functions ###
  ##################################

  @spec list(ExClubhouse.Session.t()) :: {:ok, [ExClubhouse.Model.LinkedFile.t()]} | {:error, ExClubhouse.Error.t()}
  def list(%Session{} = sess) do
    Ops.LinkedFile.list() |> Client.HTTP.request(sess) |> Parser.parse()
  end

  @spec get(ExClubhouse.Session.t(), integer()) :: {:ok, ExClubhouse.Model.LinkedFile.t() | nil} | {:error, ExClubhouse.Error.t()}
  def get(%Session{} = session, linked_file_public_id) do
    Ops.LinkedFile.get(linked_file_public_id) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec create(ExClubhouse.Session.t(), ExClubhouse.Model.Input.LinkedFile.t()) ::
          {:ok, ExClubhouse.Model.LinkedFile.t()} | {:error, ExClubhouse.Error.t()}
  def create(%Session{} = session, %Input.LinkedFile{} = linked_file_input) do
    Ops.LinkedFile.create(linked_file_input) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec update(ExClubhouse.Session.t(), integer(), ExClubhouse.Model.Input.LinkedFile.t()) ::
          {:ok, ExClubhouse.Model.LinkedFile.t()} | {:error, ExClubhouse.Error.t()}
  def update(%Session{} = session, linked_file_public_id, %Input.LinkedFile{} = linked_file_input) do
    Ops.LinkedFile.update(linked_file_public_id, linked_file_input)
    |> Client.HTTP.request(session)
    |> Parser.parse()
  end

  @spec delete(ExClubhouse.Session.t(), integer) :: :ok | {:error, ExClubhouse.Error.t()}
  def delete(%Session{} = session, linked_file_public_id) do
    Ops.LinkedFile.delete(linked_file_public_id) |> Client.HTTP.request(session) |> Parser.parse()
  end
end
