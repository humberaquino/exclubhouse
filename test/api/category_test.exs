defmodule ExClubhouse.Api.CategoryTest do
  use ExUnit.Case, async: true
  use Mimic

  alias ExClubhouse.Support.ResponseBuilder
  alias ExClubhouse.Api.Category
  alias ExClubhouse.Model
  alias ExClubhouse.Model.Input

  describe "list/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/category/list_ok.json")
      end)

      assert {:ok,
              [
                %Model.Category{
                  id: 123,
                  name: "foo"
                }
              ]} = Category.list()
    end
  end

  describe "get/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/category/get_ok.json")
      end)

      category_id = 123

      assert {:ok,
              %Model.Category{
                id: ^category_id,
                name: "foo"
              }} = Category.get(category_id)
    end

    test "not found response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_not_found_response()
      end)

      category_id = 1

      assert :not_found = Category.get(category_id)
    end
  end

  describe "create/2" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/category/get_ok.json")
      end)

      category_input = %Input.Category{}

      assert {:ok,
              %Model.Category{
                id: 123,
                name: "foo"
              }} = Category.create(category_input)
    end
  end

  describe "update/2" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/category/get_ok.json")
      end)

      category_id = 123

      category_input = %Input.Category{}

      assert {:ok,
              %Model.Category{
                id: ^category_id,
                name: "foo"
              }} = Category.update(category_id, category_input)
    end
  end

  describe "delete/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_empty_response()
      end)

      category_id = 123

      assert :ok = Category.delete(category_id)
    end
  end

  describe "milestone_list/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/category/milestone_list_ok.json")
      end)

      category_id = 123

      assert {:ok,
              [
                %Model.Milestone{
                  id: 123,
                  name: "foo"
                }
              ]} = Category.milestone_list(category_id)
    end
  end
end
