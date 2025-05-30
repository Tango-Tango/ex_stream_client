defmodule ExStreamClient.Model.GetReactionsResponse do
  @moduledoc "Schema representing a GetReactionsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :reactions]
  defstruct [:duration, :reactions]
  @nested_components %{reactions: ExStreamClient.Model.Reaction}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{duration: String.t(), reactions: [ExStreamClient.Model.Reaction.t()]}
end
