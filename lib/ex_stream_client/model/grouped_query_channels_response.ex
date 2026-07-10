defmodule ExStreamClient.Model.GroupedQueryChannelsResponse do
  @moduledoc "Schema representing a GroupedQueryChannelsResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :groups]
  defstruct [:duration, :groups]
  @nested_components groups: {:map, ExStreamClient.Model.GroupedChannelsBucket}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          groups: %{optional(String.t()) => ExStreamClient.Model.GroupedChannelsBucket.t()}
        }
end
