defmodule ExStreamClient.Model.ScreensharingSettingsResponse do
  @moduledoc "Schema representing a ScreensharingSettingsResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:access_request_enabled, :enabled]
  defstruct [:access_request_enabled, :enabled, :target_resolution]
  @nested_components target_resolution: ExStreamClient.Model.TargetResolution
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          access_request_enabled: boolean(),
          enabled: boolean(),
          target_resolution: ExStreamClient.Model.TargetResolution.t() | nil
        }
end
