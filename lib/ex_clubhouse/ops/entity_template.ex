defmodule ExClubhouse.Ops.EntityTemplate do
  @moduledoc """
  Entity template operations
  """

  alias ExClubhouse.Operation
  alias ExClubhouse.Model.Input

  @spec list :: ExClubhouse.Operation.t()
  def list do
    %Operation{
      id: :entity_template_list,
      method: :get,
      path: "entity-templates"
    }
  end

  @spec get(binary()) :: ExClubhouse.Operation.t()
  def get(entity_template_public_id) do
    %Operation{
      id: :entity_template_get,
      method: :get,
      path: "entity-templates/#{entity_template_public_id}"
    }
  end

  @spec create(ExClubhouse.Model.Input.EntityTemplate.t()) :: ExClubhouse.Operation.t()
  def create(%Input.EntityTemplate{} = epic_input) do
    %Operation{
      id: :entity_template_create,
      method: :post,
      body: Map.from_struct(epic_input),
      path: "entity-templates"
    }
  end

  @spec update(binary(), ExClubhouse.Model.Input.EntityTemplate.t()) :: ExClubhouse.Operation.t()
  def update(entity_template_public_id, %Input.EntityTemplate{} = epic_input) do
    %Operation{
      id: :entity_template_update,
      method: :put,
      body: Map.from_struct(epic_input),
      path: "entity-templates/#{entity_template_public_id}"
    }
  end

  @spec delete(binary()) :: ExClubhouse.Operation.t()
  def delete(entity_template_public_id) do
    %Operation{
      id: :entity_template_delete,
      method: :delete,
      path: "entity-templates/#{entity_template_public_id}"
    }
  end

  @spec disable :: ExClubhouse.Operation.t()
  def disable do
    %Operation{
      id: :entity_template_disable,
      method: :put,
      path: "entity-templates/disable"
    }
  end

  @spec enable :: ExClubhouse.Operation.t()
  def enable do
    %Operation{
      id: :entity_template_enable,
      method: :put,
      path: "entity-templates/enable"
    }
  end
end
