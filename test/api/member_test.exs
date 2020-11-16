defmodule ExClubhouse.Api.MemberTest do
  use ExUnit.Case, async: true
  use Mimic

  alias ExClubhouse.Support.ResponseBuilder
  alias ExClubhouse.Api.Member
  alias ExClubhouse.Model

  describe "current_member_info/1" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/member/get_current_member_info_ok.json")
      end)

      assert {:ok,
              %Model.MemberInfo{
                id: "12345678-9012-3456-7890-123456789012",
                name: "foo"
              }} = Member.current_member_info()
    end
  end

  describe "list/2" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/member/list_ok.json")
      end)

      assert {:ok,
              [
                %Model.Member{
                  id: "12345678-9012-3456-7890-123456789012",
                  role: "foo"
                }
              ]} = Member.list()
    end
  end

  describe "get/3" do
    test "succeeds with the right response" do
      HTTPoison
      |> expect(:request, fn _r ->
        ResponseBuilder.build_response("test/fixtures/member/get_ok.json")
      end)

      member_id = "12345678-9012-3456-7890-123456789012"

      assert {:ok,
              %Model.Member{
                id: ^member_id,
                role: "foo"
              }} = Member.get(member_id)
    end
  end
end
