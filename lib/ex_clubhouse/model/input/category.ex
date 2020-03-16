defmodule ExClubhouse.Model.Input.Category do
  @moduledoc """
  Category input model used to create and update
  """

  @type t :: %__MODULE__{
          color: binary(),
          external_id: binary() | nil,
          name: binary(),
          type: :milestone | nil
        }

  defstruct color: nil,
            external_id: nil,
            name: nil,
            type: nil
end
