defmodule ExClubhouse.Api.EpicWorkflowTest do
  use ExUnit.Case, async: true
  use Mimic

  alias ExClubhouse.Support.ResponseBuilder
  alias ExClubhouse.Api.EpicWorkflow
  alias ExClubhouse.{Session, Model}

  describe "get/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/epic_workflow/get_ok.json")
      end)

      assert {:ok,
              %Model.EpicWorkflow{
                id: 123,
                default_epic_state_id: 123
              }} = Session.new("dummy") |> EpicWorkflow.get()
    end

    test "not found response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_not_found_response()
      end)

      assert :not_found = Session.new("dummy") |> EpicWorkflow.get()
    end
  end
end
