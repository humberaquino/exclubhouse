defmodule ExClubhouse.Api.File do
  @moduledoc """
  File api
  """
  alias ExClubhouse.Ops
  alias ExClubhouse.{Client, Session, Config}
  alias ExClubhouse.Parse.Parser
  alias ExClubhouse.Model.Input

  ##############################################
  ### Default config based utility functions ###
  ##############################################

  @doc """
  Lists all files

  ## Example
      iex> ExClubhouse.Api.File.list()
      {:ok, [%ExClubhouse.Model.File{...}, ...]}
  """
  @spec list :: {:error, ExClubhouse.Error.t()} | {:ok, [ExClubhouse.Model.File.t()]}
  def list do
    Config.default() |> Session.from() |> list()
  end

  @doc """
  Get a single file by id

  ## Example
      iex> ExClubhouse.Api.File.get(1)
      {:ok, %ExClubhouse.Model.File{...}}
  """
  @spec get(integer) :: {:error, ExClubhouse.Error.t()} | {:ok, nil | ExClubhouse.Model.File.t()}
  def get(file_public_id) do
    Config.default() |> Session.from() |> get(file_public_id)
  end

  @doc """
  Update a file

  ## Example
      iex> ExClubhouse.Api.File.update(1, ExClubhouse.Model.Input.File{...})
      {:ok, %ExClubhouse.Model.File{...}}
  """
  @spec update(integer, ExClubhouse.Model.Input.File.t()) :: {:error, ExClubhouse.Error.t()} | {:ok, ExClubhouse.Model.File.t()}
  def update(file_public_id, %Input.File{} = file_input) do
    Config.default() |> Session.from() |> update(file_public_id, file_input)
  end

  @doc """
   Delete a file

   ## Example
      iex> ExClubhouse.Api.File.delete(1)
      :ok
  """
  @spec delete(integer) :: :ok | {:error, ExClubhouse.Error.t()}
  def delete(file_public_id) do
    Config.default() |> Session.from() |> delete(file_public_id)
  end

  @doc """
   Uploads a single file

   ## Example
      iex> ExClubhouse.Api.File.upload("/path/to/file.jpg")
      {:ok, %ExClubhouse.Model.File{...}}
  """
  @spec upload(binary) :: {:ok, [ExClubhouse.Model.File.t()]} | {:error, ExClubhouse.Error.t()}
  def upload(file_path) do
    Config.default() |> Session.from() |> upload(file_path)
  end

  ##################################
  ### Session specific functions ###
  ##################################

  @spec list(ExClubhouse.Session.t()) :: {:ok, [ExClubhouse.Model.File.t()]} | {:error, ExClubhouse.Error.t()}
  def list(%Session{} = sess) do
    Ops.File.list() |> Client.HTTP.request(sess) |> Parser.parse()
  end

  @spec get(ExClubhouse.Session.t(), integer()) :: {:ok, ExClubhouse.Model.File.t() | nil} | {:error, ExClubhouse.Error.t()}
  def get(%Session{} = session, file_public_id) do
    Ops.File.get(file_public_id) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec update(ExClubhouse.Session.t(), integer(), ExClubhouse.Model.Input.File.t()) ::
          {:ok, ExClubhouse.Model.File.t()} | {:error, ExClubhouse.Error.t()}
  def update(%Session{} = session, file_public_id, %Input.File{} = file_input) do
    Ops.File.update(file_public_id, file_input) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec delete(ExClubhouse.Session.t(), integer) :: :ok | {:error, ExClubhouse.Error.t()}
  def delete(%Session{} = session, file_public_id) do
    Ops.File.delete(file_public_id) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec upload(ExClubhouse.Session.t(), binary) :: {:ok, [ExClubhouse.Model.File.t()]} | {:error, ExClubhouse.Error.t()}
  def upload(%Session{} = session, file_path) do
    Ops.File.upload(file_path) |> Client.HTTP.upload(session) |> Parser.parse()
  end
end
