defmodule ExStreamClient.Model.GetReactionsResponse do
  @moduledoc "Schema representing a GetReactionsResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :reactions]
  defstruct [:duration, :reactions]
  @nested_components reactions: ExStreamClient.Model.ReactionResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          reactions: [ExStreamClient.Model.ReactionResponse.t()]
        }
end
