defmodule ExClubhouse.Model.MemberInfo do
  @moduledoc """
   Member info model
  """

  alias ExClubhouse.Model

  @type t :: %__MODULE__{
          id: binary(),
          mention_name: binary(),
          name: binary(),
          workspace2: Model.BasicWorkspaceInfo.t()
        }

  defstruct id: nil,
            mention_name: nil,
            name: nil,
            workspace2: nil
end
