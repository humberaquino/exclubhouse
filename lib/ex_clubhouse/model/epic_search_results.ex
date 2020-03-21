defmodule ExClubhouse.Model.EpicSearchResults do
  @moduledoc """
  Epic search results model
  """

  alias ExClubhouse.Model

  @type t :: %__MODULE__{
          cursors: list(binary()),
          data: list(Model.Epic.t()),
          total: integer()
        }

  defstruct cursors: nil, data: nil, next: nil, total: nil
end
