defmodule ExStreamClient.Model.ChannelMutedEvent do
  @moduledoc "Schema representing a ChannelMutedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :type]
  defstruct [:created_at, :type]
  @nested_components created_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{created_at: DateTime.t() | integer() | String.t(), type: String.t()}
end
