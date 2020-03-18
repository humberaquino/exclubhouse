defmodule ExClubhouse.ParseTest do
  use ExUnit.Case, async: true

  alias ExClubhouse.{Parse, Error, Operation}
  alias ExClubhouse.Client.Result

  defmodule Test1 do
    defstruct test: nil, age: nil
  end

  describe "decode/2" do
    test "fails at parsing an invalid json string" do
      body = ~s({ "test": "value", "age": 2)

      assert {:error,
              %Error{
                reason: "Error on line: 27",
                message: "Can't parse response body"
              }} = Parse.Parser.decode(body, as: %Test1{})
    end
  end

  describe "parse/1" do
    test "fails to decode when rule doesn't exist" do
      assert_raise RuntimeError, "Parse rule not found for operation: non_existing", fn ->
        Parse.Parser.parse(%Result{success: true, response: nil, operation: %Operation{id: :non_existing}})
      end
    end
  end
end
