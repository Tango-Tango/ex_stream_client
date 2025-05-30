defmodule ExStreamClient.Model.RTMPEgressConfig do
  @moduledoc "Schema representing a RTMPEgressConfig"
  use ExStreamClient.Jason
  defstruct [:composite_app_settings, :quality, :rtmp_location]

  @nested_components composite_app_settings: ExStreamClient.Model.CompositeAppSettings,
                     quality: ExStreamClient.Model.Quality
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          composite_app_settings: ExStreamClient.Model.CompositeAppSettings.t() | nil,
          quality: ExStreamClient.Model.Quality.t() | nil,
          rtmp_location: String.t() | nil
        }
end
