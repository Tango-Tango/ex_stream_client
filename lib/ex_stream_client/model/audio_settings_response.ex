defmodule ExStreamClient.Model.AudioSettingsResponse do
  @moduledoc "Schema representing a AudioSettingsResponse"
  use ExStreamClient.Jason

  @enforce_keys [
    :access_request_enabled,
    :default_device,
    :mic_default_on,
    :opus_dtx_enabled,
    :redundant_coding_enabled,
    :speaker_default_on
  ]
  defstruct [
    :access_request_enabled,
    :default_device,
    :mic_default_on,
    :opus_dtx_enabled,
    :redundant_coding_enabled,
    :speaker_default_on,
    :noise_cancellation
  ]

  @type t :: %__MODULE__{
          access_request_enabled: boolean(),
          default_device: :earpiece | :speaker,
          mic_default_on: boolean(),
          opus_dtx_enabled: boolean(),
          redundant_coding_enabled: boolean(),
          speaker_default_on: boolean(),
          noise_cancellation: ExStreamClient.Model.NoiseCancellationSettings.t() | nil
        }
end