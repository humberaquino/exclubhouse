defmodule ExClubhouse.Ops.Member do
  @moduledoc """
    Member ops
  """

  alias ExClubhouse.Operation

  @spec current_member_info :: ExClubhouse.Operation.t()
  def current_member_info() do
    %Operation{
      id: :member_current_info_get,
      method: :get,
      path: "member"
    }
  end

  @spec list() :: ExClubhouse.Operation.t()
  def list do
    %Operation{
      id: :member_list,
      method: :get,
      path: "members"
    }
  end

  @spec get(binary()) :: ExClubhouse.Operation.t()
  def get(member_public_id) do
    %Operation{
      id: :member_get,
      method: :get,
      path: "members/#{member_public_id}"
    }
  end
end
