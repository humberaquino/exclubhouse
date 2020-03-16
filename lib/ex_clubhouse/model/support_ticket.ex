defmodule ExClubhouse.Model.SupportTicket do
  @moduledoc """
  Support ticket response model
  """

  @type t :: %__MODULE__{
          epic_ids: list(integer()),
          external_id: binary(),
          external_url: binary(),
          id: binary(),
          story_ids: list(integer())
        }

  defstruct epic_ids: nil,
            external_id: nil,
            external_url: nil,
            id: nil,
            story_ids: nil
end
