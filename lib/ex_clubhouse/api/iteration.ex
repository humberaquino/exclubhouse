defmodule ExClubhouse.Api.Iteration do
  @moduledoc """
  Iteration API
  """

  alias ExClubhouse.Ops
  alias ExClubhouse.{Client, Session, Config}
  alias ExClubhouse.Parse.Parser
  alias ExClubhouse.Model.Input

  ##############################################
  ### Default config based utility functions ###
  ##############################################

  @doc """
  Lists all iterations

  ## Example
      iex> ExClubhouse.Api.Iteration.list()
      {:ok, [%ExClubhouse.Model.Iteration{...}, ...]}
  """
  @spec list() :: {:ok, [ExClubhouse.Model.IterationSlim.t()]} | {:error, ExClubhouse.Error.t()}
  def list do
    Config.default() |> Session.from() |> list()
  end

  @doc """
  Get a single iteration by id

  ## Example
      iex> ExClubhouse.Api.Iteration.get(1)
      {:ok, %ExClubhouse.Model.Iteration{...}}
  """
  @spec get(integer()) :: {:ok, ExClubhouse.Model.Iteration.t() | nil} | {:error, ExClubhouse.Error.t()}
  def get(iteration_public_id) do
    Config.default() |> Session.from() |> get(iteration_public_id)
  end

  @doc """
  Create an Iteration

  ## Example
      iex> ExClubhouse.Api.Iteration.create(ExClubhouse.Model.Input.Iteration{...})
      {:ok, %ExClubhouse.Model.Iteration{...}}
  """
  @spec create(ExClubhouse.Model.Input.Iteration.t()) ::
          {:ok, ExClubhouse.Model.Iteration.t()} | {:error, ExClubhouse.Error.t()}
  def create(%Input.Iteration{} = iteration_input) do
    Config.default() |> Session.from() |> create(iteration_input)
  end

  @doc """
  Update an iteration

  ## Example
      iex> ExClubhouse.Api.Iteration.update(ExClubhouse.Model.Input.Iteration{...})
      {:ok, %ExClubhouse.Model.Iteration{...}}
  """
  @spec update(integer(), ExClubhouse.Model.Input.Iteration.t()) ::
          {:ok, ExClubhouse.Model.Iteration.t()} | {:error, ExClubhouse.Error.t()}
  def update(iteration_public_id, %Input.Iteration{} = iteration_input) do
    Config.default() |> Session.from() |> update(iteration_public_id, iteration_input)
  end

  @doc """
   Delete an iteration

   ## Example
      iex> ExClubhouse.Api.Iteration.delete(1)
      :ok
  """
  @spec delete(integer) :: :ok | {:error, ExClubhouse.Error.t()}
  def delete(iteration_public_id) do
    Config.default() |> Session.from() |> delete(iteration_public_id)
  end

  @doc """
   Disable a category

   ## Example
      iex> ExClubhouse.Api.Iteration.disable()
      :ok
  """
  @spec disable :: :ok | {:error, ExClubhouse.Error.t()}
  def disable do
    Config.default() |> Session.from() |> disable()
  end

  @doc """
   Enable a category

   ## Example
      iex> ExClubhouse.Api.Iteration.enable()
      :ok
  """
  @spec enable :: :ok | {:error, ExClubhouse.Error.t()}
  def enable do
    Config.default() |> Session.from() |> enable()
  end

  @doc """
  Lists all iterations

  ## Example
      iex> ExClubhouse.Api.Iteration.list()
      {:ok, [%ExClubhouse.Model.Iteration{...}, ...]}
  """
  @spec stories_list(integer()) :: {:ok, [ExClubhouse.Model.StorySlim.t()]} | {:error, ExClubhouse.Error.t()}
  def stories_list(iteration_public_id) do
    Config.default() |> Session.from() |> stories_list(iteration_public_id)
  end

  ##################################
  ### Session specific functions ###
  ##################################

  @spec list(ExClubhouse.Session.t()) :: {:ok, [ExClubhouse.Model.IterationSlim.t()]} | {:error, ExClubhouse.Error.t()}
  def list(%Session{} = sess) do
    Ops.Iteration.list() |> Client.HTTP.request(sess) |> Parser.parse()
  end

  @spec get(ExClubhouse.Session.t(), integer()) :: {:ok, ExClubhouse.Model.IterationSlim.t() | nil} | {:error, ExClubhouse.Error.t()}
  def get(%Session{} = session, iteration_public_id) do
    Ops.Iteration.get(iteration_public_id) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec create(ExClubhouse.Session.t(), ExClubhouse.Model.Input.Iteration.t()) ::
          {:ok, ExClubhouse.Model.IterationSlim.t()} | {:error, ExClubhouse.Error.t()}
  def create(%Session{} = session, %Input.Iteration{} = iteration_input) do
    Ops.Iteration.create(iteration_input) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec update(ExClubhouse.Session.t(), integer(), ExClubhouse.Model.Input.Iteration.t()) ::
          {:ok, ExClubhouse.Model.IterationSlim.t()} | {:error, ExClubhouse.Error.t()}
  def update(
        %Session{} = session,
        iteration_public_id,
        %Input.Iteration{} = iteration_input
      ) do
    Ops.Iteration.update(iteration_public_id, iteration_input)
    |> Client.HTTP.request(session)
    |> Parser.parse()
  end

  @spec delete(ExClubhouse.Session.t(), integer) :: :ok | {:error, ExClubhouse.Error.t()}
  def delete(%Session{} = session, iteration_public_id) do
    Ops.Iteration.delete(iteration_public_id)
    |> Client.HTTP.request(session)
    |> Parser.parse()
  end

  @spec disable(ExClubhouse.Session.t()) :: :ok | {:error, ExClubhouse.Error.t()}
  def disable(%Session{} = session) do
    Ops.Iteration.disable()
    |> Client.HTTP.request(session)
    |> Parser.parse()
  end

  @spec enable(ExClubhouse.Session.t()) :: :ok | {:error, ExClubhouse.Error.t()}
  def enable(%Session{} = session) do
    Ops.Iteration.enable()
    |> Client.HTTP.request(session)
    |> Parser.parse()
  end

  @spec stories_list(ExClubhouse.Session.t(), integer()) :: {:ok, [ExClubhouse.Model.StorySlim.t()]} | {:error, ExClubhouse.Error.t()}
  def stories_list(%Session{} = sess, iteration_public_id) do
    Ops.Iteration.stories_list(iteration_public_id) |> Client.HTTP.request(sess) |> Parser.parse()
  end
end
