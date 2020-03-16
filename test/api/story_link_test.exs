defmodule ExClubhouse.Api.StoryLinkTest do
  use ExUnit.Case, async: true
  use Mimic

  alias ExClubhouse.Support.ResponseBuilder
  alias ExClubhouse.Api.StoryLink
  alias ExClubhouse.{Session, Model}
  alias ExClubhouse.Model.Input

  describe "get/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/story_link/get_ok.json")
      end)

      story_link_id = 123

      assert {:ok,
              %Model.StoryLink{
                id: ^story_link_id
              }} = Session.new("dummy") |> StoryLink.get(story_link_id)
    end
  end

  describe "create/2" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/story_link/get_ok.json")
      end)

      story_link_input = %Input.StoryLink{}

      assert {:ok,
              %Model.StoryLink{
                id: 123
              }} = Session.new("dummy") |> StoryLink.create(story_link_input)
    end
  end

  describe "update/2" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/story_link/get_ok.json")
      end)

      story_link_id = 123

      story_link_input = %Input.StoryLink{}

      assert {:ok,
              %Model.StoryLink{
                id: ^story_link_id
              }} = Session.new("dummy") |> StoryLink.update(story_link_id, story_link_input)
    end
  end

  describe "delete/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_empty_response()
      end)

      story_link_id = 123

      assert :ok = Session.new("dummy") |> StoryLink.delete(story_link_id)
    end
  end
end
