defmodule ExStreamClient.Model.GetRateLimitsResponse do
  @moduledoc "Schema representing a GetRateLimitsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:android, :duration, :ios, :server_side, :web]

  @type t :: %__MODULE__{
          android: map() | nil,
          duration: String.t(),
          ios: map() | nil,
          server_side: map() | nil,
          web: map() | nil
        }
end