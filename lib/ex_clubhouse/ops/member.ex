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

  @spec list(binary()) :: ExClubhouse.Operation.t()
  def list(org_public_id) do
    %Operation{
      id: :member_list,
      method: :get,
      path: "members",
      body: %{
        "org-public-id" => org_public_id
      }
    }
  end

  @spec get(binary(), binary()) :: ExClubhouse.Operation.t()
  def get(org_public_id, member_public_id) do
    %Operation{
      id: :member_get,
      method: :get,
      body: %{"org-public-id" => org_public_id},
      path: "members/#{member_public_id}"
    }
  end
end
