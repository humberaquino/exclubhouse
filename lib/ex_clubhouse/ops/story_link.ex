defmodule ExClubhouse.Ops.StoryLink do
  @moduledoc """
  Story link ops
  """

  alias ExClubhouse.Operation
  alias ExClubhouse.Model.Input

  @spec get(integer()) :: ExClubhouse.Operation.t()
  def get(story_link_public_id) do
    %Operation{
      id: :story_link_get,
      method: :get,
      path: "story-links/#{story_link_public_id}"
    }
  end

  @spec create(ExClubhouse.Model.Input.StoryLink.t()) :: ExClubhouse.Operation.t()
  def create(%Input.StoryLink{} = story_link_input) do
    %Operation{
      id: :story_link_create,
      method: :post,
      body: Map.from_struct(story_link_input),
      path: "story-links"
    }
  end

  @spec update(integer(), ExClubhouse.Model.Input.StoryLink.t()) :: ExClubhouse.Operation.t()
  def update(story_link_public_id, %Input.StoryLink{} = story_link_input) do
    %Operation{
      id: :story_link_update,
      method: :put,
      body: Map.from_struct(story_link_input),
      path: "story-links/#{story_link_public_id}"
    }
  end

  @spec delete(integer()) :: ExClubhouse.Operation.t()
  def delete(story_link_public_id) do
    %Operation{
      id: :story_link_delete,
      method: :delete,
      path: "story-links/#{story_link_public_id}"
    }
  end
end
