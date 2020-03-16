defmodule ExClubhouse.Ops.Repository do
  @moduledoc """
  Repository ops
  """

  alias ExClubhouse.Operation

  @spec list :: ExClubhouse.Operation.t()
  def list do
    %Operation{
      id: :repository_list,
      method: :get,
      path: "repositories"
    }
  end

  @spec get(integer()) :: ExClubhouse.Operation.t()
  def get(repository_public_id) do
    %Operation{
      id: :repository_get,
      method: :get,
      path: "repositories/#{repository_public_id}"
    }
  end
end
