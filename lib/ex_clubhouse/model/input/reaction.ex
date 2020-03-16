defmodule ExClubhouse.Model.Input.Reaction do
  @moduledoc """
  Reaction input model
  """

  @type t :: %__MODULE__{
          emoji: binary()
        }

  defstruct emoji: nil
end
