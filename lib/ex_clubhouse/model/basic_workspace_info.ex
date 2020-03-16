defmodule ExClubhouse.Model.BasicWorkspaceInfo do
  @moduledoc """
    Baic workspace info model
  """

  @type t :: %__MODULE__{
          estimate_scale: list(integer()),
          url_slug: binary()
        }

  defstruct estimate_scale: nil, url_slug: nil
end
