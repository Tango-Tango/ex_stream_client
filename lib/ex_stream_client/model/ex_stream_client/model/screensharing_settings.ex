defmodule ExStreamClient.Model.ScreensharingSettings do
  @moduledoc "Schema representing a ScreensharingSettings"
  use ExStreamClient.Jason
  @enforce_keys [:access_request_enabled, :enabled]
  defstruct [:enabled, :access_request_enabled, :target_resolution]

  @type t :: %__MODULE__{
          enabled: boolean(),
          access_request_enabled: boolean(),
          target_resolution: ExStreamClient.Model.TargetResolution.t() | nil
        }
end