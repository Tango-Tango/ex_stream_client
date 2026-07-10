defmodule ExStreamClient.Model.QueryChannelsResponse do
  @moduledoc "Schema representing a QueryChannelsResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:channels, :duration]
  defstruct [:channels, :duration, :predefined_filter]

  @nested_components channels: ExStreamClient.Model.ChannelStateResponseFields,
                     predefined_filter: ExStreamClient.Model.ParsedPredefinedFilterResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channels: [ExStreamClient.Model.ChannelStateResponseFields.t()],
          duration: String.t(),
          predefined_filter: ExStreamClient.Model.ParsedPredefinedFilterResponse.t() | nil
        }
end
