defmodule ExStreamClient.Model.GetReactionsResponse do
  @moduledoc "Schema representing a GetReactionsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :reactions]
  defstruct [:duration, :reactions]
  @type t :: %__MODULE__{duration: String.t(), reactions: [ExStreamClient.Model.Reaction.t()]}
end