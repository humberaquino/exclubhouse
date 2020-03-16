defmodule ExClubhouse.Api.Label do
  @moduledoc """
  Label API
  """

  alias ExClubhouse.Ops
  alias ExClubhouse.{Client, Session, Config}
  alias ExClubhouse.Parse.Parser
  alias ExClubhouse.Model.Input

  ##############################################
  ### Default config based utility functions ###
  ##############################################

  @doc """
  Lists all labels

  ## Example
      iex> ExClubhouse.Api.Label.list()
      {:ok, [%ExClubhouse.Model.Label{...}, ...]}
  """
  @spec list :: {:ok, [ExClubhouse.Model.Label.t()]} | {:error, ExClubhouse.Error.t()}
  def list do
    Config.default() |> Session.from() |> list()
  end

  @doc """
  Get a single label by id

  ## Example
      iex> ExClubhouse.Api.Label.get(1)
      {:ok, %ExClubhouse.Model.Label{...}}
  """
  @spec get(integer) :: {:ok, nil | ExClubhouse.Model.Label.t()} | {:error, ExClubhouse.Error.t()}
  def get(label_public_id) do
    Config.default() |> Session.from() |> get(label_public_id)
  end

  @doc """
  Create a Label

  ## Example
      iex> ExClubhouse.Api.Label.create(ExClubhouse.Model.Input.Label{...})
      {:ok, %ExClubhouse.Model.Label{...}}
  """
  @spec create(ExClubhouse.Model.Input.Label.t()) :: {:ok, ExClubhouse.Model.Label.t()} | {:error, ExClubhouse.Error.t()}
  def create(%Input.Label{} = label_input) do
    Config.default() |> Session.from() |> create(label_input)
  end

  @doc """
  Update a label

  ## Example
      iex> ExClubhouse.Api.Label.update(1, ExClubhouse.Model.Input.Label{...})
      {:ok, %ExClubhouse.Model.Label{...}}
  """
  @spec update(integer, ExClubhouse.Model.Input.Label.t()) :: {:ok, ExClubhouse.Model.Label.t()} | {:error, ExClubhouse.Error.t()}
  def update(label_public_id, %Input.Label{} = label_input) do
    Config.default() |> Session.from() |> update(label_public_id, label_input)
  end

  @doc """
   Delete a label

   ## Example
      iex> ExClubhouse.Api.Label.delete(1)
      :ok
  """
  @spec delete(integer) :: :ok | {:error, ExClubhouse.Error.t()}
  def delete(label_public_id) do
    Config.default() |> Session.from() |> delete(label_public_id)
  end

  @doc """
  Lists all epics for a label

  ## Example
      iex> ExClubhouse.Api.Label.epics_list(1)
      {:ok, [%ExClubhouse.Model.EpicSlim{...}, ...]}
  """
  @spec epics_list(integer) :: {:ok, [ExClubhouse.Model.EpicSlim.t()]} | {:error, ExClubhouse.Error.t()}
  def epics_list(label_public_id) do
    Config.default() |> Session.from() |> epics_list(label_public_id)
  end

  @doc """
  Lists all stories for a label

  ## Example
      iex> ExClubhouse.Api.Label.stories_list(1)
      {:ok, [%ExClubhouse.Model.StorySlim{...}, ...]}
  """
  @spec stories_list(integer) :: {:ok, [ExClubhouse.Model.StorySlim.t()]} | {:error, ExClubhouse.Error.t()}
  def stories_list(label_public_id) do
    Config.default() |> Session.from() |> epics_list(label_public_id)
  end

  ##################################
  ### Session specific functions ###
  ##################################

  @spec list(ExClubhouse.Session.t()) :: {:ok, [ExClubhouse.Model.Label.t()]} | {:error, ExClubhouse.Error.t()}
  def list(%Session{} = sess) do
    Ops.Label.list() |> Client.HTTP.request(sess) |> Parser.parse()
  end

  @spec get(ExClubhouse.Session.t(), integer()) :: {:ok, ExClubhouse.Model.Label.t() | nil} | {:error, ExClubhouse.Error.t()}
  def get(%Session{} = session, label_public_id) do
    Ops.Label.get(label_public_id) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec create(ExClubhouse.Session.t(), ExClubhouse.Model.Input.Label.t()) ::
          {:ok, ExClubhouse.Model.Label.t()} | {:error, ExClubhouse.Error.t()}
  def create(%Session{} = session, %Input.Label{} = label_input) do
    Ops.Label.create(label_input) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec update(ExClubhouse.Session.t(), integer(), ExClubhouse.Model.Input.Label.t()) ::
          {:ok, ExClubhouse.Model.Label.t()} | {:error, ExClubhouse.Error.t()}
  def update(%Session{} = session, label_public_id, %Input.Label{} = label_input) do
    Ops.Label.update(label_public_id, label_input)
    |> Client.HTTP.request(session)
    |> Parser.parse()
  end

  @spec delete(ExClubhouse.Session.t(), integer) :: :ok | {:error, ExClubhouse.Error.t()}
  def delete(%Session{} = session, label_public_id) do
    Ops.Label.delete(label_public_id) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec epics_list(ExClubhouse.Session.t(), integer()) :: {:ok, [ExClubhouse.Model.EpicSlim.t()]} | {:error, ExClubhouse.Error.t()}
  def epics_list(%Session{} = sess, label_public_id) do
    Ops.Label.epics_list(label_public_id) |> Client.HTTP.request(sess) |> Parser.parse()
  end

  @spec stories_list(ExClubhouse.Session.t(), integer()) :: {:ok, [ExClubhouse.Model.StorySlim.t()]} | {:error, ExClubhouse.Error.t()}
  def stories_list(%Session{} = sess, label_public_id) do
    Ops.Label.stories_list(label_public_id) |> Client.HTTP.request(sess) |> Parser.parse()
  end
end
