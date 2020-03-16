defmodule ExClubhouse.Api.Category do
  @moduledoc """
  Category API
  """

  alias ExClubhouse.Ops
  alias ExClubhouse.{Client, Session, Config}
  alias ExClubhouse.Parse.Parser
  alias ExClubhouse.Model.Input

  ##############################################
  ### Default config based utility functions ###
  ##############################################

  @doc """
  Lists all categories

  ## Example
      iex> ExClubhouse.Api.Category.list()
      {:ok, [%ExClubhouse.Model.Category{...}, ...]}
  """
  @spec list :: {:ok, [ExClubhouse.Model.Category.t()]} | {:error, ExClubhouse.Error.t()}
  def list do
    Config.default() |> Session.from() |> list()
  end

  @doc """
   Gets a single category by id

   ## Example
      iex> ExClubhouse.Api.Category.get(18)
      {:ok, %ExClubhouse.Model.Category{...}}
  """
  @spec get(integer) :: {:ok, ExClubhouse.Model.Category.t() | nil} | {:error, ExClubhouse.Error.t()}
  def get(category_public_id) do
    Config.default() |> Session.from() |> get(category_public_id)
  end

  @doc """
   Creates a category

   ## Example
      iex> ExClubhouse.Api.Category.create(ExClubhouse.Model.Input.Category{...})
      {:ok, %ExClubhouse.Model.Category{...}}
  """
  @spec create(ExClubhouse.Model.Input.Category.t()) :: {:ok, ExClubhouse.Model.Category.t()} | {:error, ExClubhouse.Error.t()}
  def create(%Input.Category{} = category_input) do
    Config.default() |> Session.from() |> create(category_input)
  end

  @doc """
   Updates a category

   ## Example
      iex> ExClubhouse.Api.Category.update(1, ExClubhouse.Model.Input.Category{...})
      {:ok, %ExClubhouse.Model.Category{...}}
  """
  @spec update(integer, ExClubhouse.Model.Input.Category.t()) :: {:ok, ExClubhouse.Model.Category.t()} | {:error, ExClubhouse.Error.t()}
  def update(category_public_id, %Input.Category{} = category_input) do
    Config.default() |> Session.from() |> update(category_public_id, category_input)
  end

  @doc """
   Delete a category

   ## Example
      iex> ExClubhouse.Api.Category.delete(1)
      :ok
  """
  @spec delete(integer) :: :ok | {:error, ExClubhouse.Error.t()}
  def delete(category_public_id) do
    Config.default() |> Session.from() |> delete(category_public_id)
  end

  @doc """
  List all category milestones

  ## Example
      iex> ExClubhouse.Api.Category.milestone_list(12)
      {:ok, [%ExClubhouse.Model.Milestone{...}, ...]}
  """
  @spec milestone_list(integer) :: {:ok, [ExClubhouse.Model.Milestone.t()]} | {:error, ExClubhouse.Error.t()}
  def milestone_list(category_public_id) do
    Config.default() |> Session.from() |> milestone_list(category_public_id)
  end

  ##################################
  ### Session specific functions ###
  ##################################

  @spec list(ExClubhouse.Session.t()) :: {:ok, [ExClubhouse.Model.Category.t()]} | {:error, ExClubhouse.Error.t()}
  def list(%Session{} = sess) do
    Ops.Category.list() |> Client.HTTP.request(sess) |> Parser.parse()
  end

  @spec get(ExClubhouse.Session.t(), integer) :: {:ok, ExClubhouse.Model.Category.t() | nil} | {:error, ExClubhouse.Error.t()}
  def get(%Session{} = session, category_public_id) do
    Ops.Category.get(category_public_id) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec create(ExClubhouse.Session.t(), ExClubhouse.Model.Input.Category.t()) ::
          {:ok, ExClubhouse.Model.Category.t()} | {:error, ExClubhouse.Error.t()}
  def create(%Session{} = session, %Input.Category{} = category_input) do
    Ops.Category.create(category_input) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec update(ExClubhouse.Session.t(), integer, ExClubhouse.Model.Input.Category.t()) ::
          {:ok, ExClubhouse.Model.Category.t()} | {:error, ExClubhouse.Error.t()}
  def update(%Session{} = session, category_public_id, %Input.Category{} = category_input) do
    Ops.Category.update(category_public_id, category_input)
    |> Client.HTTP.request(session)
    |> Parser.parse()
  end

  @spec delete(ExClubhouse.Session.t(), integer) :: :ok | {:error, ExClubhouse.Error.t()}
  def delete(%Session{} = session, category_public_id) do
    Ops.Category.delete(category_public_id) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec milestone_list(ExClubhouse.Session.t(), integer) ::
          {:ok, ExClubhouse.Model.Category.t() | nil} | {:error, ExClubhouse.Error.t()}
  def milestone_list(%Session{} = session, category_public_id) do
    Ops.Category.milestone_list(category_public_id) |> Client.HTTP.request(session) |> Parser.parse()
  end
end
