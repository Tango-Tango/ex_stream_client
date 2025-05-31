defmodule ExStreamClient.Model.ListChannelTypesResponse do
  @moduledoc "Schema representing a ListChannelTypesResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:channel_types, :duration]
  defstruct [:channel_types, :duration]
  @nested_components channel_types: {:map, ExStreamClient.Model.ChannelTypeConfig}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel_types: %{optional(String.t()) => ExStreamClient.Model.ChannelTypeConfig.t()},
          duration: String.t()
        }
end
