defmodule ExStreamClient.Model.ListChannelTypesResponse do
  @moduledoc "Schema representing a ListChannelTypesResponse"
  use ExStreamClient.Jason
  @enforce_keys [:channel_types, :duration]
  defstruct [:channel_types, :duration]
  @type t :: %__MODULE__{channel_types: map(), duration: String.t()}
end