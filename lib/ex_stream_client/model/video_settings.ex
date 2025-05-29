defmodule ExStreamClient.Model.VideoSettings do
  @moduledoc "Schema representing a VideoSettings"
  use ExStreamClient.Jason

  @enforce_keys [
    :access_request_enabled,
    :camera_default_on,
    :camera_facing,
    :enabled,
    :target_resolution
  ]
  defstruct [
    :enabled,
    :access_request_enabled,
    :target_resolution,
    :camera_default_on,
    :camera_facing
  ]

  @type t :: %__MODULE__{
          enabled: boolean(),
          access_request_enabled: boolean(),
          target_resolution: ExStreamClient.Model.TargetResolution.t(),
          camera_default_on: boolean(),
          camera_facing: :external | :back | :front
        }
end