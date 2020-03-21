defmodule ExClubhouse.Api.SearchTest do
  use ExUnit.Case, async: true
  use Mimic

  alias ExClubhouse.Support.ResponseBuilder
  alias ExClubhouse.Api.Search
  alias ExClubhouse.Model
  alias ExClubhouse.Model.Input

  describe "search/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/search/get_search_results_ok.json")
      end)

      assert {:ok,
              %Model.SearchResults{
                epics: _epics,
                stories: _stories
              }} = Search.search(%Input.Search{page_size: 10, query: "test"})
    end
  end

  describe "search_epics/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/search/get_epic_search_results_ok.json")
      end)

      assert {:ok,
              %Model.EpicSearchResults{
                data: _data
              }} = Search.search_epics(%Input.Search{page_size: 10, query: "test"})
    end
  end

  describe "search_stories/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/search/get_story_search_results_ok.json")
      end)

      assert {:ok,
              %Model.StorySearchResults{
                data: _data
              }} = Search.search_stories(%Input.Search{page_size: 10, query: "test"})
    end
  end
end
