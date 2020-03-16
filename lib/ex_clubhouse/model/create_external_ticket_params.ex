defmodule ExClubhouse.Model.CreateExternalTicketParams do
  @moduledoc """
  Creat external ticket params model
  """

  @type t :: %__MODULE__{
          externa_id: binary(),
          external_url: binary()
        }

  defstruct externa_id: nil, external_url: nil
end
