defmodule ExClubhouse.Api.EpicTest do
  use ExUnit.Case, async: true
  use Mimic

  alias ExClubhouse.Support.ResponseBuilder
  alias ExClubhouse.Api.Epic
  alias ExClubhouse.{Ops, Session, Client, Model}
  alias ExClubhouse.Parse.Parser
  alias ExClubhouse.Model.Input

  describe "list/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/epic/list_ok.json")
      end)

      assert {:ok,
              [
                %Model.EpicSlim{
                  id: 123,
                  app_url: "foo",
                  stats: %Model.EpicStats{num_points: 123}
                }
              ]} = Session.new("dummy") |> Epic.list()
    end

    test "succeeds composed request with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/epic/list_ok.json")
      end)

      sess = Session.new("dummy")

      assert {:ok,
              [
                %Model.EpicSlim{
                  id: 123,
                  app_url: "foo",
                  stats: %Model.EpicStats{num_points: 123}
                }
              ]} = Ops.Epic.list() |> Client.HTTP.request(sess) |> Parser.parse()
    end
  end

  describe "get/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/epic/get_ok.json")
      end)

      epic_id = 123

      assert {:ok,
              %Model.Epic{
                id: ^epic_id,
                app_url: "foo",
                stats: %Model.EpicStats{num_points: 123}
              }} = Session.new("dummy") |> Epic.get(epic_id)
    end

    test "not found response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_not_found_response()
      end)

      epic_id = 1

      assert :not_found = Session.new("dummy") |> Epic.get(epic_id)
    end
  end

  describe "create/2" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/epic/get_ok.json")
      end)

      epic_input = %Input.Epic{
        completed_at_override: "2016-12-31T12:30:00Z",
        created_at: "2016-12-31T12:30:00Z",
        deadline: "2016-12-31T12:30:00Z",
        description: "foo",
        epic_state_id: 123,
        external_id: "foo",
        follower_ids: ["12345678-9012-3456-7890-123456789012"],
        labels: [
          %Input.Label{
            color: "foo",
            description: "foo",
            external_id: "foo",
            name: "foo"
          }
        ],
        milestone_id: 123,
        name: "foo",
        owner_ids: ["12345678-9012-3456-7890-123456789012"],
        planned_start_date: "2016-12-31T12:30:00Z",
        requested_by_id: "12345678-9012-3456-7890-123456789012",
        started_at_override: "2016-12-31T12:30:00Z",
        state: "foo",
        updated_at: "2016-12-31T12:30:00Z"
      }

      assert {:ok,
              %Model.Epic{
                id: 123,
                app_url: "foo",
                stats: %Model.EpicStats{num_points: 123}
              }} = Session.new("dummy") |> Epic.create(epic_input)
    end
  end

  describe "update/2" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/epic/get_ok.json")
      end)

      epic_id = 123

      epic_input = %Input.Epic{
        completed_at_override: "2016-12-31T12:30:00Z",
        created_at: "2016-12-31T12:30:00Z",
        deadline: "2016-12-31T12:30:00Z",
        description: "foo",
        epic_state_id: 123,
        external_id: "foo",
        follower_ids: ["12345678-9012-3456-7890-123456789012"],
        labels: [
          %Input.Label{
            color: "foo",
            description: "foo",
            external_id: "foo",
            name: "foo"
          }
        ],
        milestone_id: 123,
        name: "foo",
        owner_ids: ["12345678-9012-3456-7890-123456789012"],
        planned_start_date: "2016-12-31T12:30:00Z",
        requested_by_id: "12345678-9012-3456-7890-123456789012",
        started_at_override: "2016-12-31T12:30:00Z",
        state: "foo",
        updated_at: "2016-12-31T12:30:00Z"
      }

      assert {:ok,
              %Model.Epic{
                id: ^epic_id,
                app_url: "foo",
                stats: %Model.EpicStats{num_points: 123}
              }} = Session.new("dummy") |> Epic.update(epic_id, epic_input)
    end
  end

  describe "delete/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_empty_response()
      end)

      epic_id = 123

      assert :ok = Session.new("dummy") |> Epic.delete(epic_id)
    end
  end
end
