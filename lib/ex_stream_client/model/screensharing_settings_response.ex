defmodule ExStreamClient.Model.ScreensharingSettingsResponse do
  @moduledoc "Schema representing a ScreensharingSettingsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:access_request_enabled, :enabled]
  defstruct [:access_request_enabled, :enabled, :target_resolution]

  @type t :: %__MODULE__{
          access_request_enabled: boolean(),
          enabled: boolean(),
          target_resolution: ExStreamClient.Model.TargetResolution.t() | nil
        }
end