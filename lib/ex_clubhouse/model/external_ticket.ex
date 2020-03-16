defmodule ExClubhouse.Model.ExternalTicket do
  @moduledoc """
  External ticket response model
  """

  @type t :: %__MODULE__{
          epic_ids: list(integer()),
          external_id: binary(),
          external_url: binary(),
          id: binary(),
          story_ids: list(integer())
        }

  defstruct epic_ids: [], external_id: nil, external_url: nil, id: nil, story_ids: []
end
