defmodule ExClubhouse.Api.LabelTest do
  use ExUnit.Case, async: true
  use Mimic

  alias ExClubhouse.Support.ResponseBuilder
  alias ExClubhouse.Api.Label
  alias ExClubhouse.Model
  alias ExClubhouse.Model.Input

  describe "list/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/label/list_ok.json")
      end)

      assert {:ok,
              [
                %Model.Label{
                  id: 123,
                  name: "foo"
                }
              ]} = Label.list()
    end
  end

  describe "get/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/label/get_ok.json")
      end)

      label_id = 123

      assert {:ok,
              %Model.Label{
                id: ^label_id,
                name: "foo"
              }} = Label.get(label_id)
    end

    test "not found response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_not_found_response()
      end)

      label_id = 1

      assert :not_found = Label.get(label_id)
    end
  end

  describe "create/2" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/label/get_ok.json")
      end)

      label_input = %Input.Label{}

      assert {:ok,
              %Model.Label{
                id: 123,
                name: "foo"
              }} = Label.create(label_input)
    end
  end

  describe "update/2" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/label/get_ok.json")
      end)

      label_id = 123

      label_input = %Input.Label{}

      assert {:ok,
              %Model.Label{
                id: ^label_id,
                name: "foo"
              }} = Label.update(label_id, label_input)
    end
  end

  describe "delete/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_empty_response()
      end)

      label_id = 123

      assert :ok = Label.delete(label_id)
    end
  end

  describe "epics_list/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/label/epics_list_ok.json")
      end)

      label_id = 123

      assert {:ok,
              [
                %Model.EpicSlim{
                  id: ^label_id,
                  name: "foo"
                }
              ]} = Label.epics_list(label_id)
    end
  end

  describe "stories_list/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/label/stories_list_ok.json")
      end)

      label_id = 123

      assert {:ok,
              [
                %Model.StorySlim{
                  id: ^label_id,
                  name: "foo"
                }
              ]} = Label.stories_list(label_id)
    end
  end
end
