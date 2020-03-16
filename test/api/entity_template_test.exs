defmodule ExClubhouse.Api.EntityTemplateTest do
  use ExUnit.Case, async: true
  use Mimic

  alias ExClubhouse.Support.ResponseBuilder
  alias ExClubhouse.Api.EntityTemplate
  alias ExClubhouse.{Session, Model}
  alias ExClubhouse.Model.Input

  describe "list/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/entity_template/list_ok.json")
      end)

      assert {:ok,
              [
                %Model.EntityTemplate{
                  author_id: "12345678-9012-3456-7890-123456789012",
                  created_at: "2016-12-31T12:30:00Z",
                  entity_type: "foo",
                  id: "12345678-9012-3456-7890-123456789012"
                }
              ]} = Session.new("dummy") |> EntityTemplate.list()
    end
  end

  describe "get/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/entity_template/get_ok.json")
      end)

      entity_template_id = 123

      assert {:ok,
              %Model.EntityTemplate{
                author_id: "12345678-9012-3456-7890-123456789012",
                created_at: "2016-12-31T12:30:00Z",
                entity_type: "foo",
                id: "12345678-9012-3456-7890-123456789012"
              }} = Session.new("dummy") |> EntityTemplate.get(entity_template_id)
    end

    test "not found response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_not_found_response()
      end)

      entity_template_id = 1

      assert :not_found = Session.new("dummy") |> EntityTemplate.get(entity_template_id)
    end
  end

  describe "create/2" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/entity_template/get_ok.json")
      end)

      category_input = %Input.EntityTemplate{}

      assert {:ok,
              %Model.EntityTemplate{
                author_id: "12345678-9012-3456-7890-123456789012",
                created_at: "2016-12-31T12:30:00Z",
                entity_type: "foo",
                id: "12345678-9012-3456-7890-123456789012"
              }} = Session.new("dummy") |> EntityTemplate.create(category_input)
    end
  end

  describe "update/2" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/entity_template/get_ok.json")
      end)

      entity_template_id = 123

      category_input = %Input.EntityTemplate{}

      assert {:ok,
              %Model.EntityTemplate{
                author_id: "12345678-9012-3456-7890-123456789012",
                created_at: "2016-12-31T12:30:00Z",
                entity_type: "foo",
                id: "12345678-9012-3456-7890-123456789012"
              }} = Session.new("dummy") |> EntityTemplate.update(entity_template_id, category_input)
    end
  end

  describe "delete/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_empty_response()
      end)

      entity_template_id = 123

      assert :ok = Session.new("dummy") |> EntityTemplate.delete(entity_template_id)
    end
  end

  describe "disable/0" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_empty_response()
      end)

      assert :ok = Session.new("dummy") |> EntityTemplate.disable()
    end
  end

  describe "enable/0" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_empty_response()
      end)

      assert :ok = Session.new("dummy") |> EntityTemplate.enable()
    end
  end
end
