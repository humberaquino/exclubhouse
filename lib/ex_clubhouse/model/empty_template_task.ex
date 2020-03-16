defmodule ExClubhouse.Model.EmptyTemplateTask do
  @moduledoc """
  Empty template task model
  """

  @type t :: %__MODULE__{
          complete: boolean(),
          description: binary(),
          external_id: binary(),
          owner_ids: list(binary())
        }

  defstruct complete: nil, description: nil, external_id: nil, owner_ids: []
end
