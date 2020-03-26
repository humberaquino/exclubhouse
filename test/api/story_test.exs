defmodule ExClubhouse.Api.StoryTest do
  use ExUnit.Case, async: true
  use Mimic

  alias ExClubhouse.Support.ResponseBuilder
  alias ExClubhouse.Api.Story
  alias ExClubhouse.Model
  alias ExClubhouse.Model.Input

  describe "create/2" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/story/get_ok.json")
      end)

      story_input = %Input.Story{}

      assert {:ok,
              %Model.Story{
                id: 123,
                name: "foo"
              }} = Story.create(story_input)
    end
  end

  describe "get/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/story/get_ok.json")
      end)

      story_id = 123

      assert {:ok,
              %Model.Story{
                id: ^story_id,
                name: "foo"
              }} = Story.get(story_id)
    end
  end

  describe "update/2" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/story/get_ok.json")
      end)

      story_id = 123

      story_update_input = %Input.StoryUpdate{}

      assert {:ok,
              %Model.Story{
                id: ^story_id,
                name: "foo"
              }} = Story.update(story_id, story_update_input)
    end
  end

  describe "delete/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_empty_response()
      end)

      story_id = 123

      assert :ok = Story.delete(story_id)
    end
  end

  describe "create_comment/2" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/story/get_comment_ok.json")
      end)

      story_public_id = 123
      comment_input = %Input.Comment{}

      assert {:ok,
              %Model.Comment{
                id: 123,
                text: "foo"
              }} = Story.create_comment(story_public_id, comment_input)
    end
  end

  describe "get_comment/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/story/get_comment_ok.json")
      end)

      story_public_id = 123
      comment_public_id = 123

      assert {:ok,
              %Model.Comment{
                id: 123,
                text: "foo"
              }} = Story.get_comment(story_public_id, comment_public_id)
    end
  end

  describe "update_comment/2" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/story/get_comment_ok.json")
      end)

      story_public_id = 123
      comment_public_id = 123

      update_comment_input = %Input.UpdateComment{}

      assert {:ok,
              %Model.Comment{
                id: 123,
                text: "foo"
              }} = Story.update_comment(story_public_id, comment_public_id, update_comment_input)
    end
  end

  describe "delete_comment/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_empty_response()
      end)

      story_public_id = 123
      comment_public_id = 123

      assert :ok = Story.delete_comment(story_public_id, comment_public_id)
    end
  end

  describe "create_reaction/3" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/story/get_reaction_list_ok.json")
      end)

      story_public_id = 123
      comment_public_id = 123
      reaction_input = %Input.Reaction{}

      assert {:ok,
              [
                %Model.Reaction{
                  emoji: "foo"
                }
              ]} = Story.create_reaction(story_public_id, comment_public_id, reaction_input)
    end
  end

  describe "delete_reaction/2" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_empty_response()
      end)

      story_public_id = 123
      comment_public_id = 123

      assert :ok = Story.delete_reaction(story_public_id, comment_public_id)
    end
  end

  describe "get_task/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/story/get_task_ok.json")
      end)

      story_public_id = 123
      task_public_id = 123

      assert {:ok,
              %Model.Task{
                id: 123,
                complete: true
              }} = Story.get_task(story_public_id, task_public_id)
    end
  end

  describe "update_task/2" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/story/get_task_ok.json")
      end)

      story_public_id = 123
      task_public_id = 123

      update_task_input = %Input.UpdateTask{}

      assert {:ok,
              %Model.Task{
                id: 123,
                complete: true
              }} = Story.update_task(story_public_id, task_public_id, update_task_input)
    end
  end

  describe "delete_task/2" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_empty_response()
      end)

      story_public_id = 123
      task_public_id = 123

      assert :ok = Story.delete_task(story_public_id, task_public_id)
    end
  end
end
