defmodule ExClubhouse.Ops.Project do
  @moduledoc """
  Project ops
  """

  alias ExClubhouse.Operation
  alias ExClubhouse.Model.Input

  @spec list :: ExClubhouse.Operation.t()
  def list do
    %Operation{
      id: :project_list,
      method: :get,
      path: "projects"
    }
  end

  @spec get(integer()) :: ExClubhouse.Operation.t()
  def get(project_public_id) do
    %Operation{
      id: :project_get,
      method: :get,
      path: "projects/#{project_public_id}"
    }
  end

  @spec create(ExClubhouse.Model.Input.Project.t()) :: ExClubhouse.Operation.t()
  def create(%Input.Project{} = project_input) do
    %Operation{
      id: :project_create,
      method: :post,
      body: Map.from_struct(project_input),
      path: "projects"
    }
  end

  @spec update(integer(), ExClubhouse.Model.Input.Project.t()) :: ExClubhouse.Operation.t()
  def update(project_public_id, %Input.Project{} = project_input) do
    %Operation{
      id: :project_update,
      method: :put,
      body: Map.from_struct(project_input),
      path: "projects/#{project_public_id}"
    }
  end

  @spec delete(integer()) :: ExClubhouse.Operation.t()
  def delete(project_public_id) do
    %Operation{
      id: :project_delete,
      method: :delete,
      path: "projects/#{project_public_id}"
    }
  end

  @spec story_list(integer()) :: ExClubhouse.Operation.t()
  def story_list(project_public_id) do
    %Operation{
      id: :project_milestone_list,
      method: :get,
      path: "projects/#{project_public_id}/stories"
    }
  end
end
