defmodule ExStreamClient.Model.GetRateLimitsResponse do
  @moduledoc "Schema representing a GetRateLimitsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration, :android, :ios, :server_side, :web]

  @type t :: %__MODULE__{
          duration: String.t(),
          android: map() | nil,
          ios: map() | nil,
          server_side: map() | nil,
          web: map() | nil
        }
end