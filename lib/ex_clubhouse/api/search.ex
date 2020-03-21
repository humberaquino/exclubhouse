defmodule ExClubhouse.Api.Search do
  @moduledoc """
  Search API
  """

  alias ExClubhouse.Ops
  alias ExClubhouse.{Client, Session, Config}
  alias ExClubhouse.Parse.Parser
  alias ExClubhouse.Model.Input

  ##############################################
  ### Default config based utility functions ###
  ##############################################

  @doc """
   Search epics and stories

   ## Example
      iex> ExClubhouse.Api.Search.search(%ExClubhouse.Model.Input.Search{..})
      {:ok, %{ExClubhouse.Model.SearchResults{epics: ..., stories: ...}}}
  """
  @spec search(Input.Search.t()) :: {:ok, ExClubhouse.Model.SearchResults.t()} | {:error, ExClubhouse.Error.t()}
  def search(%Input.Search{} = search_input) do
    Config.default() |> Session.from() |> search(search_input)
  end

  @doc """
   Search epics

   ## Example
      iex> ExClubhouse.Api.Search.search_epics(%ExClubhouse.Model.Input.Search{..})
      {:ok, %{ExClubhouse.Model.EpicSearchResults{epics: ..., stories: ...}}}
  """
  @spec search_epics(Input.Search.t()) :: {:ok, ExClubhouse.Model.EpicSearchResults.t()} | {:error, ExClubhouse.Error.t()}
  def search_epics(%Input.Search{} = search_input) do
    Config.default() |> Session.from() |> search_epics(search_input)
  end

  @doc """
   Search stories

   ## Example
      iex> ExClubhouse.Api.Search.search_stories(%ExClubhouse.Model.Input.Search{..})
      {:ok, %{ExClubhouse.Model.StorySearchResults{epics: ..., stories: ...}}}
  """
  @spec search_stories(Input.Search.t()) :: {:ok, ExClubhouse.Model.StorySearchResults.t()} | {:error, ExClubhouse.Error.t()}
  def search_stories(%Input.Search{} = search_input) do
    Config.default() |> Session.from() |> search_stories(search_input)
  end

  ##################################
  ### Session specific functions ###
  ##################################

  @spec search(ExClubhouse.Session.t(), Input.Search.t()) :: {:ok, ExClubhouse.Model.SearchResults.t()} | {:error, ExClubhouse.Error.t()}
  def search(%Session{} = session, %Input.Search{} = search_input) do
    Ops.Search.search(search_input) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec search_epics(ExClubhouse.Session.t(), Input.Search.t()) :: {:ok, ExClubhouse.Model.EpicSearchResults.t()} | {:error, ExClubhouse.Error.t()}
  def search_epics(%Session{} = session, %Input.Search{} = search_input) do
    Ops.Search.search_epics(search_input) |> Client.HTTP.request(session) |> Parser.parse()
  end

  @spec search_stories(ExClubhouse.Session.t(), Input.Search.t()) :: {:ok, ExClubhouse.Model.StorySearchResults.t()} | {:error, ExClubhouse.Error.t()}
  def search_stories(%Session{} = session, %Input.Search{} = search_input) do
    Ops.Search.search_stories(search_input) |> Client.HTTP.request(session) |> Parser.parse()
  end
end
