defmodule ExClubhouse.Api.IterationTest do
  use ExUnit.Case, async: true
  use Mimic

  alias ExClubhouse.Support.ResponseBuilder
  alias ExClubhouse.Api.Iteration

  alias ExClubhouse.Model
  alias ExClubhouse.Model.Input

  describe "list/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/iteration/list_ok.json")
      end)

      assert {:ok,
              [
                %Model.IterationSlim{
                  id: 123
                }
              ]} = Iteration.list()
    end
  end

  describe "get/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/iteration/get_ok.json")
      end)

      iteration_id = 123

      assert {:ok,
              %Model.Iteration{
                id: 123
              }} = Iteration.get(iteration_id)
    end

    test "not found response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_not_found_response()
      end)

      iteration_id = 1

      assert :not_found = Iteration.get(iteration_id)
    end
  end

  describe "create/2" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/iteration/get_ok.json")
      end)

      category_input = %Input.Iteration{}

      assert {:ok,
              %Model.Iteration{
                id: 123
              }} = Iteration.create(category_input)
    end
  end

  describe "update/2" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/iteration/get_ok.json")
      end)

      iteration_id = 123

      category_input = %Input.Iteration{}

      assert {:ok,
              %Model.Iteration{
                id: 123
              }} = Iteration.update(iteration_id, category_input)
    end
  end

  describe "delete/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_empty_response()
      end)

      iteration_id = 123

      assert :ok = Iteration.delete(iteration_id)
    end
  end

  describe "disable/0" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_empty_response()
      end)

      assert :ok = Iteration.disable()
    end
  end

  describe "enable/0" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_empty_response()
      end)

      assert :ok = Iteration.enable()
    end
  end
end
