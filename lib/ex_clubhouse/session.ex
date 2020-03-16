defmodule ExClubhouse.Session do
  @moduledoc """
  Holds the token and any other information required to make requests
  """

  alias ExClubhouse.{Session, Config}

  @type t :: %__MODULE__{
          token: binary()
        }

  defstruct token: nil

  @spec new(binary) :: Session.t()
  def new(token) when is_binary(token) do
    %Session{token: token}
  end

  def new(nil) do
    raise "Token not configured"
  end

  @spec from(ExClubhouse.Config.t()) :: ExClubhouse.Session.t()
  def from(%Config{} = config) do
    new(config.token)
  end
end
