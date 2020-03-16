defmodule ExClubhouse.Model.CreateLabelParams do
  @moduledoc """
  Create label params model
  """

  @type t :: %__MODULE__{
          color: binary(),
          description: binary(),
          external_id: binary(),
          name: binary()
        }

  defstruct color: nil, description: nil, external_id: nil, name: nil
end
