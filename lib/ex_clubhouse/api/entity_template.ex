defmodule ExClubhouse.Api.EntityTemplate do
  @moduledoc """
  Entity template API
  """

  alias ExClubhouse.Ops
  alias ExClubhouse.{Client, Session, Config}
  alias ExClubhouse.Parse.Parser
  alias ExClubhouse.Model.Input

  ##############################################
  ### Default config based utility functions ###
  ##############################################

  @doc """
  Lists all entity templates

  ## Example
      iex> ExClubhouse.Api.EntityTemplate.list()
      {:ok, [%ExClubhouse.Model.EntityTemplate{...}, ...]}
  """
  @spec list :: {:ok, [ExClubhouse.Model.EntityTemplate.t()]} | {:error, ExClubhouse.Error.t()}
  def list do
    Config.default() |> Session.from() |> list()
  end

  @doc """
  Get an entity template by UUID

  ## Example
      iex> ExClubhouse.Api.EntityTemplate.get("E6DE045E-3A51-4116-85B6-9449801A002E")
      {:ok, %ExClubhouse.Model.EntityTemplate{...}}
  """
  @spec get(binary()) :: {:ok, ExClubhouse.Model.EntityTemplate.t() | nil} | {:error, ExClubhouse.Error.t()}
  def get(entity_template_public_id) do
    Config.default() |> Session.from() |> get(entity_template_public_id)
  end

  @doc """
  Creates an entity template

  ## Example
      iex> ExClubhouse.Api.EntityTemplate.create(%Input.EntityTemplate{...})
      {:ok, %ExClubhouse.Model.EntityTemplate{...}}
  """
  @spec create(ExClubhouse.Model.Input.EntityTemplate.t()) :: {:ok, ExClubhouse.Model.EntityTemplate.t()} | {:error, ExClubhouse.Error.t()}
  def create(%Input.EntityTemplate{} = epic_input) do
    Config.default() |> Session.from() |> create(epic_input)
  end

  @doc """
  Updates an entity template

  ## Example
      iex> ExClubhouse.Api.EntityTemplate.update(%Input.EntityTemplate{...})
      {:ok, %ExClubhouse.Model.EntityTemplate{...}}
  """
  @spec update(binary, ExClubhouse.Model.Input.EntityTemplate.t()) ::
          {:ok, ExClubhouse.Model.EntityTemplate.t()} | {:error, ExClubhouse.Error.t()}
  def update(entity_template_public_id, %Input.EntityTemplate{} = epic_input) do
    Config.default() |> Session.from() |> update(entity_template_public_id, epic_input)
  end

  @doc """
  Deletes an entity template

  ## Example
      iex> ExClubhouse.Api.EntityTemplate.delete("E6DE045E-3A51-4116-85B6-9449801A002E")
      :ok
  """
  @spec delete(binary) :: :ok | {:error, ExClubhouse.Error.t()}
  def delete(entity_template_public_id) do
    Config.default() |> Session.from() |> delete(entity_template_public_id)
  end

  @doc """
  Disable entity templates

  ## Example
      iex> ExClubhouse.Api.EntityTemplate.disable()
      :ok
  """
  @spec disable :: :ok | {:error, ExClubhouse.Error.t()}
  def disable do
    Config.default() |> Session.from() |> disable()
  end

  @doc """
  Enable entity templates

  ## Example
      iex> ExClubhouse.Api.EntityTemplate.enable()
      :ok
  """
  @spec enable :: :ok | {:error, ExClubhouse.Error.t()}
  def enable do
    Config.default() |> Session.from() |> enable()
  end

  ##################################
  ### Session specific functions ###
  ##################################

  @spec list(Session.t()) :: {:ok, [ExClubhouse.Model.EntityTemplate.t()]} | {:error, ExClubhouse.Error.t()}
  def list(%Session{} = sess) do
    Ops.EntityTemplate.list() |> Client.HTTP.request(sess) |> Parser.parse()
  end

  @spec get(ExClubhouse.Session.t(), binary) :: {:ok, ExClubhouse.Model.EntityTemplate.t() | nil} | {:error, ExClubhouse.Error.t()}
  def get(%Session{} = session, entity_template_public_id) do
    Ops.EntityTemplate.get(entity_template_public_id) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec create(ExClubhouse.Session.t(), ExClubhouse.Model.Input.EntityTemplate.t()) ::
          {:ok, ExClubhouse.Model.EntityTemplate.t()} | {:error, ExClubhouse.Error.t()}
  def create(%Session{} = session, %Input.EntityTemplate{} = epic_input) do
    Ops.EntityTemplate.create(epic_input) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec update(ExClubhouse.Session.t(), binary, ExClubhouse.Model.Input.EntityTemplate.t()) ::
          {:ok, ExClubhouse.Model.EntityTemplate.t()} | {:error, ExClubhouse.Error.t()}
  def update(
        %Session{} = session,
        entity_template_public_id,
        %Input.EntityTemplate{} = epic_input
      ) do
    Ops.EntityTemplate.update(entity_template_public_id, epic_input)
    |> Client.HTTP.request(session)
    |> Parser.parse()
  end

  @spec delete(ExClubhouse.Session.t(), binary) :: :ok | {:error, ExClubhouse.Error.t()}
  def delete(%Session{} = session, entity_template_public_id) do
    Ops.EntityTemplate.delete(entity_template_public_id)
    |> Client.HTTP.request(session)
    |> Parser.parse()
  end

  @spec disable(ExClubhouse.Session.t()) :: :ok | {:error, ExClubhouse.Error.t()}
  def disable(%Session{} = session) do
    Ops.EntityTemplate.disable()
    |> Client.HTTP.request(session)
    |> Parser.parse()
  end

  @spec enable(ExClubhouse.Session.t()) :: :ok | {:error, ExClubhouse.Error.t()}
  def enable(%Session{} = session) do
    Ops.EntityTemplate.enable()
    |> Client.HTTP.request(session)
    |> Parser.parse()
  end
end
