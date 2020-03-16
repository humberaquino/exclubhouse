defmodule ExClubhouse.Model.Member do
  @moduledoc """
    Member model
  """

  alias ExClubhouse.Model

  @type t :: %__MODULE__{
          created_at: binary() | nil,
          disabled: boolean(),
          entity_type: binary(),
          group_ids: list(binary()),
          id: binary(),
          profile: Model.Profile.t(),
          role: binary(),
          updated_at: binary() | nil
        }

  defstruct created_at: nil,
            disabled: nil,
            entity_type: nil,
            group_ids: nil,
            id: nil,
            profile: nil,
            role: nil,
            updated_at: nil
end
