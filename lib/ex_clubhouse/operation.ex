defmodule ExClubhouse.Operation do
  @moduledoc """
  Encapsulates a request operation
  """

  @type t :: %__MODULE__{
          id: atom(),
          method: :delete | :get | :head | :options | :patch | :post | :put,
          path: binary(),
          params: map() | nil,
          headers: [any()] | nil,
          body: map() | tuple() | nil,
          options: [any()] | nil
        }

  defstruct id: :undefined,
            method: :get,
            params: %{},
            path: "",
            headers: [],
            body: %{},
            options: []
end
