defmodule ExStreamClient.Model.RecordSettingsResponse do
  @moduledoc "Schema representing a RecordSettingsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:audio_only, :layout, :mode, :quality]
  defstruct [:mode, :quality, :audio_only, :layout]

  @type t :: %__MODULE__{
          mode: String.t(),
          quality: String.t(),
          audio_only: boolean(),
          layout: ExStreamClient.Model.LayoutSettingsResponse.t()
        }
end