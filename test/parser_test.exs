defmodule ExClubhouse.ParseTest do
  use ExUnit.Case, async: true

  alias ExClubhouse.Parse
  alias ExClubhouse.Error

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
end
