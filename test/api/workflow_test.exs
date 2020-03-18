defmodule ExClubhouse.Api.WorkflowTest do
  use ExUnit.Case, async: true
  use Mimic

  alias ExClubhouse.Support.ResponseBuilder
  alias ExClubhouse.Api.Workflow
  alias ExClubhouse.Model

  describe "list/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/workflow/list_ok.json")
      end)

      assert {:ok,
              [
                %Model.Workflow{
                  id: 123,
                  name: "foo"
                }
              ]} = Workflow.list()
    end
  end
end
