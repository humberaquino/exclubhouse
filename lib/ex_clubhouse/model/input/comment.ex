defmodule ExClubhouse.Model.Input.Comment do
  @moduledoc """
  Comment input model
  """

  @type t :: %__MODULE__{
          author_id: binary() | nil,
          created_at: binary() | nil,
          external_id: binary() | nil,
          text: binary(),
          updated_at: binary() | nil
        }

  defstruct author_id: nil, created_at: nil, external_id: nil, text: nil, updated_at: nil
end
