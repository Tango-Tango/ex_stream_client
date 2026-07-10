defmodule ExStreamClient.Model.GetRateLimitsResponse do
  @moduledoc "Schema representing a GetRateLimitsResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration]
  defstruct [:android, :duration, :ios, :server_side, :web]

  @nested_components android: {:map, ExStreamClient.Model.LimitInfoResponse},
                     ios: {:map, ExStreamClient.Model.LimitInfoResponse},
                     server_side: {:map, ExStreamClient.Model.LimitInfoResponse},
                     web: {:map, ExStreamClient.Model.LimitInfoResponse}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          android: %{optional(String.t()) => ExStreamClient.Model.LimitInfoResponse.t()} | nil,
          duration: String.t(),
          ios: %{optional(String.t()) => ExStreamClient.Model.LimitInfoResponse.t()} | nil,
          server_side:
            %{optional(String.t()) => ExStreamClient.Model.LimitInfoResponse.t()} | nil,
          web: %{optional(String.t()) => ExStreamClient.Model.LimitInfoResponse.t()} | nil
        }
end
