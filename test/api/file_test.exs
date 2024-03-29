defmodule ExClubhouse.Api.FileTest do
  use ExUnit.Case, async: true
  use Mimic

  alias ExClubhouse.Support.ResponseBuilder
  alias ExClubhouse.Api.File
  alias ExClubhouse.Model
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
              ]} = File.list()
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
              }} = File.get(file_id)
    end

    test "not found response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_not_found_response()
      end)

      file_id = 1

      assert :not_found = File.get(file_id)
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
              }} = File.update(file_id, file_input)
    end
  end

  describe "delete/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_empty_response()
      end)

      file_id = 123

      assert :ok = File.delete(file_id)
    end
  end

  describe "upload/1" do
    test "succeeds with the right response for a single file" do
      Elixir.File
      |> expect(:exists?, fn _ -> true end)

      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/file/upload_list_ok.json")
      end)

      assert {:ok,
              [
                %Model.File{
                  id: 123,
                  content_type: "foo"
                }
              ]} = File.upload("/path/to/file")
    end

    test "succeeds with the right response for multiple file" do
      Elixir.File
      |> stub(:exists?, fn _ -> true end)

      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/file/upload_list2_ok.json")
      end)

      assert {:ok,
              [
                %Model.File{
                  id: 123,
                  content_type: "foo"
                },
                %Model.File{
                  id: 124,
                  content_type: "foo2"
                }
              ]} = File.upload(["/path/to/file1", "/path/to/file2"])
    end
  end
end
