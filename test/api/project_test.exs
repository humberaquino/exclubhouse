defmodule ExClubhouse.Api.ProjectTest do
  use ExUnit.Case, async: true
  use Mimic

  alias ExClubhouse.Support.ResponseBuilder
  alias ExClubhouse.Api.Project
  alias ExClubhouse.Model
  alias ExClubhouse.Model.Input

  describe "list/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/project/list_ok.json")
      end)

      assert {:ok,
              [
                %Model.Project{
                  id: 123,
                  team_id: 123
                }
              ]} = Project.list()
    end
  end

  describe "get/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/project/get_ok.json")
      end)

      project_id = 123

      assert {:ok,
              %Model.Project{
                id: ^project_id,
                team_id: 123
              }} = Project.get(project_id)
    end

    test "not found response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_not_found_response()
      end)

      project_id = 1

      assert :not_found = Project.get(project_id)
    end
  end

  describe "create/2" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/project/get_ok.json")
      end)

      project_input = %Input.Project{}

      assert {:ok,
              %Model.Project{
                id: 123,
                team_id: 123
              }} = Project.create(project_input)
    end
  end

  describe "update/2" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/project/get_ok.json")
      end)

      project_id = 123

      project_input = %Input.Project{}

      assert {:ok,
              %Model.Project{
                id: ^project_id,
                team_id: 123
              }} = Project.update(project_id, project_input)
    end
  end

  describe "delete/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_empty_response()
      end)

      project_id = 123

      assert :ok = Project.delete(project_id)
    end
  end

  describe "story_list/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/project/list_story_ok.json")
      end)

      project_id = 123

      assert {:ok,
              [
                %Model.StorySlim{
                  id: 123,
                  name: "foo"
                }
              ]} = Project.story_list(project_id)
    end
  end
end
