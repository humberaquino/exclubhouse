defmodule ExClubhouse.Api.TeamTest do
  use ExUnit.Case, async: true
  use Mimic

  alias ExClubhouse.Support.ResponseBuilder
  alias ExClubhouse.Api.Team
  alias ExClubhouse.Model

  describe "list/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/team/list_ok.json")
      end)

      assert {:ok,
              [
                %Model.Team{
                  id: 123,
                  name: "foo"
                }
              ]} = Team.list()
    end
  end

  describe "get/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/team/get_ok.json")
      end)

      team_id = 123

      assert {:ok,
              %Model.Team{
                id: ^team_id,
                name: "foo"
              }} = Team.get(team_id)
    end

    test "not found response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_not_found_response()
      end)

      team_id = 1

      assert :not_found = Team.get(team_id)
    end
  end
end
