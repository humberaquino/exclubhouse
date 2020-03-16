defmodule ExClubhouse.Ops.Team do
  @moduledoc """
  Team ops
  """

  alias ExClubhouse.Operation

  @spec list :: ExClubhouse.Operation.t()
  def list do
    %Operation{
      id: :team_list,
      method: :get,
      path: "teams"
    }
  end

  @spec get(integer()) :: ExClubhouse.Operation.t()
  def get(team_public_id) do
    %Operation{
      id: :team_get,
      method: :get,
      path: "teams/#{team_public_id}"
    }
  end
end
