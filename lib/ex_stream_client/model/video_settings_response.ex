defmodule ExStreamClient.Model.VideoSettingsResponse do
  @moduledoc "Schema representing a VideoSettingsResponse"
  use ExStreamClient.Jason

  @enforce_keys [
    :access_request_enabled,
    :camera_default_on,
    :camera_facing,
    :enabled,
    :target_resolution
  ]
  defstruct [
    :access_request_enabled,
    :camera_default_on,
    :camera_facing,
    :enabled,
    :target_resolution
  ]

  @nested_components camera_facing: :atom,
                     target_resolution: ExStreamClient.Model.TargetResolution
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          access_request_enabled: boolean(),
          camera_default_on: boolean(),
          camera_facing: :external | :back | :front,
          enabled: boolean(),
          target_resolution: ExStreamClient.Model.TargetResolution.t()
        }
end
