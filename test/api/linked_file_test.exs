defmodule ExClubhouse.Api.LinkedFileTest do
  use ExUnit.Case, async: true
  use Mimic

  alias ExClubhouse.Support.ResponseBuilder
  alias ExClubhouse.Api.LinkedFile
  alias ExClubhouse.{Session, Model}
  alias ExClubhouse.Model.Input

  describe "list/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/linked_file/list_ok.json")
      end)

      assert {:ok,
              [
                %Model.LinkedFile{
                  id: 123,
                  name: "foo"
                }
              ]} = Session.new("dummy") |> LinkedFile.list()
    end
  end

  describe "get/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/linked_file/get_ok.json")
      end)

      linked_file_id = 123

      assert {:ok,
              %Model.LinkedFile{
                id: ^linked_file_id,
                name: "foo"
              }} = Session.new("dummy") |> LinkedFile.get(linked_file_id)
    end

    test "not found response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_not_found_response()
      end)

      linked_file_id = 1

      assert :not_found = Session.new("dummy") |> LinkedFile.get(linked_file_id)
    end
  end

  describe "create/2" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/linked_file/get_ok.json")
      end)

      linked_file_input = %Input.LinkedFile{}

      assert {:ok,
              %Model.LinkedFile{
                id: 123,
                name: "foo"
              }} = Session.new("dummy") |> LinkedFile.create(linked_file_input)
    end
  end

  describe "update/2" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/linked_file/get_ok.json")
      end)

      linked_file_id = 123

      linked_file_input = %Input.LinkedFile{}

      assert {:ok,
              %Model.LinkedFile{
                id: ^linked_file_id,
                name: "foo"
              }} = Session.new("dummy") |> LinkedFile.update(linked_file_id, linked_file_input)
    end
  end

  describe "delete/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_empty_response()
      end)

      linked_file_id = 123

      assert :ok = Session.new("dummy") |> LinkedFile.delete(linked_file_id)
    end
  end
end
