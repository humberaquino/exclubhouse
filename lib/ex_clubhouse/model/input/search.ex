defmodule ExClubhouse.Model.Input.Search do
  @moduledoc """
  Search input model
  """

  @type t :: %__MODULE__{
          page_size: integer(),
          query: binary()
        }

  defstruct page_size: nil, query: nil
end
