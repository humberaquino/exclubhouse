defmodule ExClubhouse.Api.RepositoryTest do
  use ExUnit.Case, async: true
  use Mimic

  alias ExClubhouse.Support.ResponseBuilder
  alias ExClubhouse.Api.Repository
  alias ExClubhouse.{Session, Model}

  describe "list/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/repository/list_ok.json")
      end)

      assert {:ok,
              [
                %Model.Repository{
                  id: 123,
                  name: "foo"
                }
              ]} = Session.new("dummy") |> Repository.list()
    end
  end

  describe "get/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/repository/get_ok.json")
      end)

      repository_id = 123

      assert {:ok,
              %Model.Repository{
                id: ^repository_id,
                name: "foo"
              }} = Session.new("dummy") |> Repository.get(repository_id)
    end

    test "not found response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_not_found_response()
      end)

      repository_id = 1

      assert :not_found = Session.new("dummy") |> Repository.get(repository_id)
    end
  end
end
