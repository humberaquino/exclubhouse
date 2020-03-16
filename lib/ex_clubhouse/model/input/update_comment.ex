defmodule ExClubhouse.Model.Input.UpdateComment do
  @moduledoc """
  Update model input model
  """

  @type t :: %__MODULE__{
          text: binary()
        }

  defstruct text: nil
end
