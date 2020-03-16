defmodule ExClubhouse.Model.CreateCategoryParams do
  @moduledoc """
  Create category params model
  """

  @type t :: %__MODULE__{
          color: binary(),
          external_id: binary(),
          name: binary()
        }

  defstruct color: nil, external_id: nil, name: nil
end
