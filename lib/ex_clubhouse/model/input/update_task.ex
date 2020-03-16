defmodule ExClubhouse.Model.Input.UpdateTask do
  @moduledoc """
  Update task input model
  """

  @type t :: %__MODULE__{
          after_id: integer(),
          before_id: integer(),
          complete: boolean(),
          description: binary(),
          owner_ids: [binary()]
        }

  defstruct after_id: nil, before_id: nil, complete: nil, description: nil, owner_ids: nil
end
