defmodule ExClubhouse.Api.StoryLink do
  @moduledoc """
  Story link API
  """

  alias ExClubhouse.Ops
  alias ExClubhouse.{Client, Session, Config}
  alias ExClubhouse.Parse.Parser
  alias ExClubhouse.Model.Input

  ##############################################
  ### Default config based utility functions ###
  ##############################################

  @doc """
  Get a single milestone by id

  ## Example
      iex> ExClubhouse.Api.StoryLink.get(1)
      {:ok, %ExClubhouse.Model.StoryLink{...}}
  """
  @spec get(integer) :: {:ok, nil | ExClubhouse.Model.StoryLink.t()} | {:error, ExClubhouse.Error.t()}
  def get(story_link_public_id) do
    Config.default() |> Session.from() |> get(story_link_public_id)
  end

  @doc """
  Create a milestone

  ## Example
      iex> ExClubhouse.Api.StoryLink.create(ExClubhouse.Model.Input.StoryLink{...})
      {:ok, %ExClubhouse.StoryLink.Group{...}}
  """
  @spec create(ExClubhouse.Model.Input.StoryLink.t()) :: {:ok, ExClubhouse.Model.StoryLink.t()} | {:error, ExClubhouse.Error.t()}
  def create(%Input.StoryLink{} = story_link_input) do
    Config.default() |> Session.from() |> create(story_link_input)
  end

  @doc """
  Update a StoryLink

  ## Example
      iex> ExClubhouse.Api.StoryLink.update(1, ExClubhouse.Model.Input.StoryLink{...})
      {:ok, %ExClubhouse.Model.StoryLink{...}}
  """
  @spec update(integer, ExClubhouse.Model.Input.StoryLink.t()) :: {:ok, ExClubhouse.Model.StoryLink.t()} | {:error, ExClubhouse.Error.t()}
  def update(story_link_public_id, %Input.StoryLink{} = story_link_input) do
    Config.default() |> Session.from() |> update(story_link_public_id, story_link_input)
  end

  @doc """
   Delete a milestone

   ## Example
      iex> ExClubhouse.Api.StoryLink.delete(1)
      :ok
  """
  @spec delete(integer) :: :ok | {:error, ExClubhouse.Error.t()}
  def delete(story_link_public_id) do
    Config.default() |> Session.from() |> delete(story_link_public_id)
  end

  ##################################
  ### Session specific functions ###
  ##################################

  @spec get(ExClubhouse.Session.t(), integer()) :: {:ok, ExClubhouse.Model.StoryLink.t() | nil} | {:error, ExClubhouse.Error.t()}
  def get(%Session{} = session, story_link_public_id) do
    Ops.StoryLink.get(story_link_public_id) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec create(ExClubhouse.Session.t(), ExClubhouse.Model.Input.StoryLink.t()) ::
          {:ok, ExClubhouse.Model.StoryLink.t()} | {:error, ExClubhouse.Error.t()}
  def create(%Session{} = session, %Input.StoryLink{} = story_link_input) do
    Ops.StoryLink.create(story_link_input) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec update(ExClubhouse.Session.t(), integer(), ExClubhouse.Model.Input.StoryLink.t()) ::
          {:ok, ExClubhouse.Model.StoryLink.t()} | {:error, ExClubhouse.Error.t()}
  def update(%Session{} = session, story_link_public_id, %Input.StoryLink{} = story_link_input) do
    Ops.StoryLink.update(story_link_public_id, story_link_input)
    |> Client.HTTP.request(session)
    |> Parser.parse()
  end

  @spec delete(ExClubhouse.Session.t(), integer) :: :ok | {:error, ExClubhouse.Error.t()}
  def delete(%Session{} = session, story_link_public_id) do
    Ops.StoryLink.delete(story_link_public_id) |> Client.HTTP.request(session) |> Parser.parse()
  end
end
