defmodule ExClubhouse.Model.Group do
  @moduledoc """
  Group model
  """

  alias ExClubhouse.Model

  @type t :: %__MODULE__{
          app_url: binary(),
          archived: boolean(),
          description: binary(),
          display_icon: Model.Icon.t() | nil,
          entity_type: binary(),
          id: binary(),
          member_ids: list(binary()),
          mention_name: binary(),
          name: binary()
        }

  defstruct app_url: nil,
            archived: true,
            description: nil,
            display_icon: nil,
            entity_type: nil,
            id: nil,
            member_ids: [],
            mention_name: nil,
            name: nil
end
