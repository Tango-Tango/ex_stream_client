defmodule ExStreamClient.Model.RecordSettingsResponse do
  @moduledoc "Schema representing a RecordSettingsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:audio_only, :layout, :mode, :quality]
  defstruct [:audio_only, :layout, :mode, :quality]
  @nested_components layout: ExStreamClient.Model.LayoutSettingsResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          audio_only: boolean(),
          layout: ExStreamClient.Model.LayoutSettingsResponse.t(),
          mode: String.t(),
          quality: String.t()
        }
end
