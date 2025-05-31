defmodule ExStreamClient.Model.ListChannelTypesResponse do
  @moduledoc "Schema representing a ListChannelTypesResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:channel_types, :duration]
  defstruct [:channel_types, :duration]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{channel_types: map(), duration: String.t()}
end
