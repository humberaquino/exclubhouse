defmodule ExClubhouse.Model.Input.Group do
  @moduledoc """
  Group input model
  """

  @type t :: %__MODULE__{
          description: binary() | nil,
          display_icon_id: binary() | nil,
          member_ids: list(binary()) | nil,
          mention_name: binary(),
          name: binary()
        }

  defstruct description: nil,
            display_icon_id: nil,
            member_ids: [],
            mention_name: nil,
            name: nil
end
