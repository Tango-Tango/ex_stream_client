defmodule ExStreamClient.Model.QueryReactionsResponse do
  @moduledoc "Schema representing a QueryReactionsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :reactions]
  defstruct [:next, :prev, :duration, :reactions]

  @type t :: %__MODULE__{
          next: String.t() | nil,
          prev: String.t() | nil,
          duration: String.t(),
          reactions: [ExStreamClient.Model.ReactionResponse.t()]
        }
end