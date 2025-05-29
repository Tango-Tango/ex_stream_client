defmodule ExStreamClient.Model.ListChannelTypesResponse do
  @moduledoc "Schema representing a ListChannelTypesResponse"
  use ExStreamClient.Jason
  @enforce_keys [:channel_types, :duration]
  defstruct [:duration, :channel_types]
  @type t :: %__MODULE__{duration: String.t(), channel_types: map()}
end