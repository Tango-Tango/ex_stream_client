defmodule ExStreamClient.Model.ScreensharingSettings do
  @moduledoc "Schema representing a ScreensharingSettings"
  use ExStreamClient.Jason
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
