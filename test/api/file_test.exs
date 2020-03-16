defmodule ExClubhouse.Api.FileTest do
  use ExUnit.Case, async: true
  use Mimic

  alias ExClubhouse.Support.ResponseBuilder
  alias ExClubhouse.Api.File
  alias ExClubhouse.{Session, Model}
  alias ExClubhouse.Model.Input

  describe "list/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/file/list_ok.json")
      end)

      assert {:ok,
              [
                %Model.File{
                  id: 123,
                  content_type: "foo"
                }
              ]} = Session.new("dummy") |> File.list()
    end
  end

  describe "get/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/file/get_ok.json")
      end)

      file_id = 123

      assert {:ok,
              %Model.File{
                id: ^file_id,
                content_type: "foo"
              }} = Session.new("dummy") |> File.get(file_id)
    end

    test "not found response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_not_found_response()
      end)

      file_id = 1

      assert :not_found = Session.new("dummy") |> File.get(file_id)
    end
  end

  describe "update/2" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/file/get_ok.json")
      end)

      file_id = 123
      file_input = %Input.File{}

      assert {:ok,
              %Model.File{
                id: ^file_id,
                content_type: "foo"
              }} = Session.new("dummy") |> File.update(file_id, file_input)
    end
  end

  describe "delete/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_empty_response()
      end)

      file_id = 123

      assert :ok = Session.new("dummy") |> File.delete(file_id)
    end
  end
end
