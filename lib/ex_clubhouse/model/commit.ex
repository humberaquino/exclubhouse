defmodule ExClubhouse.Model.Commit do
  @moduledoc """
  Commit model
  """

  alias ExClubhouse.Model

  @type t :: %__MODULE__{
          author_email: binary(),
          author_id: binary() | nil,
          author_identity: Model.Identity.t(),
          created_at: binary(),
          entity_type: binary(),
          hash: binary(),
          id: integer() | nil,
          merged_branch_ids: list(integer()),
          message: binary(),
          respository_id: integer() | nil,
          timestamp: binary(),
          updated_at: binary() | nil,
          url: binary()
        }

  defstruct author_email: nil,
            author_id: nil,
            author_identity: nil,
            created_at: nil,
            entity_type: nil,
            hash: nil,
            id: nil,
            merged_branch_ids: nil,
            message: nil,
            respository_id: nil,
            timestamp: nil,
            updated_at: nil,
            url: nil
end
