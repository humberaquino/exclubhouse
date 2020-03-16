defmodule ExClubhouse.Model.Reaction do
  @moduledoc """
  Reaction model
  """

  @type t :: %__MODULE__{
          emoji: binary(),
          permission_ids: list(binary())
        }

  defstruct emoji: nil, permission_ids: []
end
