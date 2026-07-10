defmodule ExStreamClient.Model.FailedChannelUpdates do
  @moduledoc "Schema representing a FailedChannelUpdates"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:cids, :reason]
  defstruct [:cids, :reason]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{cids: [String.t()], reason: String.t()}
end
