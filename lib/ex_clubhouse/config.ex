defmodule ExClubhouse.Config do
  @moduledoc """
  CH related config
  """

  @type t :: %__MODULE__{
          token: binary()
        }

  defstruct token: nil

  alias __MODULE__

  @spec default :: ExClubhouse.Config.t()
  def default do
    token = Application.get_env(:exclubhouse, :token)
    %Config{token: token}
  end
end
