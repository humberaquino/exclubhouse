defmodule ExClubhouse.Ops.Search do
  @moduledoc """
  Search ops
  """

  alias ExClubhouse.Operation
  alias ExClubhouse.Model.Input

  @spec search(Input.Search.t()) :: ExClubhouse.Operation.t()
  def search(%Input.Search{} = search_input) do
    %Operation{
      id: :search_search,
      method: :get,
      body: Map.from_struct(search_input),
      path: "search"
    }
  end

  @spec search_epics(Input.Search.t()) :: ExClubhouse.Operation.t()
  def search_epics(%Input.Search{} = search_input) do
    %Operation{
      id: :search_search_epics,
      method: :get,
      body: Map.from_struct(search_input),
      path: "search/epics"
    }
  end

  @spec search_stories(Input.Search.t()) :: ExClubhouse.Operation.t()
  def search_stories(%Input.Search{} = search_input) do
    %Operation{
      id: :search_search_stories,
      method: :get,
      body: Map.from_struct(search_input),
      path: "search/stories"
    }
  end
end
