defmodule ExClubhouse.Api.MilestoneTest do
  use ExUnit.Case, async: true
  use Mimic

  alias ExClubhouse.Support.ResponseBuilder
  alias ExClubhouse.Api.Milestone
  alias ExClubhouse.Model
  alias ExClubhouse.Model.Input

  describe "list/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/milestone/list_ok.json")
      end)

      assert {:ok,
              [
                %Model.Milestone{
                  id: 123,
                  name: "foo"
                }
              ]} = Milestone.list()
    end
  end

  describe "get/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/milestone/get_ok.json")
      end)

      milestone_id = 123

      assert {:ok,
              %Model.Milestone{
                id: ^milestone_id,
                name: "foo"
              }} = Milestone.get(milestone_id)
    end

    test "not found response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_not_found_response()
      end)

      milestone_id = 1

      assert :not_found = Milestone.get(milestone_id)
    end
  end

  describe "create/2" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/milestone/get_ok.json")
      end)

      milestone_input = %Input.Milestone{}

      assert {:ok,
              %Model.Milestone{
                id: 123,
                name: "foo"
              }} = Milestone.create(milestone_input)
    end
  end

  describe "update/2" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/milestone/get_ok.json")
      end)

      milestone_id = 123

      milestone_input = %Input.Milestone{}

      assert {:ok,
              %Model.Milestone{
                id: ^milestone_id,
                name: "foo"
              }} = Milestone.update(milestone_id, milestone_input)
    end
  end

  describe "delete/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_empty_response()
      end)

      milestone_id = 123

      assert :ok = Milestone.delete(milestone_id)
    end
  end

  describe "epic_list/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/milestone/list_epic_ok.json")
      end)

      milestone_id = 123

      assert {:ok,
              [
                %Model.EpicSlim{
                  id: 123,
                  name: "foo"
                }
              ]} = Milestone.epic_list(milestone_id)
    end
  end
end
