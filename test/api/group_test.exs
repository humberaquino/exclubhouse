defmodule ExClubhouse.Api.GroupTest do
  use ExUnit.Case, async: true
  use Mimic

  alias ExClubhouse.Support.ResponseBuilder
  alias ExClubhouse.Api.Group
  alias ExClubhouse.Model
  alias ExClubhouse.Model.Input

  describe "list/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/group/list_ok.json")
      end)

      assert {:ok,
              [
                %Model.Group{
                  id: "12345678-9012-3456-7890-123456789012",
                  name: "foo"
                }
              ]} = Group.list()
    end
  end

  describe "get/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/group/get_ok.json")
      end)

      group_id = "12345678-9012-3456-7890-123456789012"

      assert {:ok,
              %Model.Group{
                id: ^group_id,
                name: "foo"
              }} = Group.get(group_id)
    end

    test "not found response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_not_found_response()
      end)

      group_id = 1

      assert :not_found = Group.get(group_id)
    end
  end

  describe "create/2" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/group/get_ok.json")
      end)

      group_input = %Input.Group{}

      assert {:ok,
              %Model.Group{
                id: "12345678-9012-3456-7890-123456789012",
                name: "foo"
              }} = Group.create(group_input)
    end
  end

  describe "update/2" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/group/get_ok.json")
      end)

      group_id = "12345678-9012-3456-7890-123456789012"

      group_input = %Input.Group{}

      assert {:ok,
              %Model.Group{
                id: ^group_id,
                name: "foo"
              }} = Group.update(group_id, group_input)
    end
  end
end
