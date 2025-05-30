defmodule ExStreamClient.Model.QueryReactionsResponse do
  @moduledoc "Schema representing a QueryReactionsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :reactions]
  defstruct [:duration, :next, :prev, :reactions]
  @nested_components reactions: ExStreamClient.Model.ReactionResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          next: String.t() | nil,
          prev: String.t() | nil,
          reactions: [ExStreamClient.Model.ReactionResponse.t()]
        }
end
