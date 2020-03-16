defmodule ExClubhouse.Model.CreateEntityTemplateExternalTicket do
  @moduledoc """
  Entity template external ticket input model
  """

  @type t :: %__MODULE__{
          external_id: binary(),
          external_url: binary()
        }

  defstruct external_id: nil, external_url: nil
end
