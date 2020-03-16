defmodule ExClubhouse.Model.Profile do
  @moduledoc """
    Profile model
  """

  alias ExClubhouse.Model

  @type t :: %__MODULE__{
          deactivated: boolean(),
          display_icon: Model.Icon.t(),
          email_address: binary() | nil,
          entity_type: binary(),
          gravatar_hash: binary(),
          id: binary(),
          mention_name: binary(),
          name: binary() | nil,
          two_factor_auth_activated: boolean()
        }

  defstruct deactivated: nil,
            display_icon: nil,
            email_address: nil,
            entity_type: nil,
            gravatar_hash: nil,
            id: nil,
            mention_name: nil,
            name: nil,
            two_factor_auth_activated: nil
end
