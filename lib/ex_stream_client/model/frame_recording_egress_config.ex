defmodule ExStreamClient.Model.FrameRecordingEgressConfig do
  @moduledoc "Schema representing a FrameRecordingEgressConfig"
  use ExStreamClient.Jason
  defstruct [:capture_interval_in_seconds, :external_storage, :quality, :storage_name]

  @nested_components external_storage: ExStreamClient.Model.ExternalStorage,
                     quality: ExStreamClient.Model.Quality
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          capture_interval_in_seconds: integer() | nil,
          external_storage: ExStreamClient.Model.ExternalStorage.t() | nil,
          quality: ExStreamClient.Model.Quality.t() | nil,
          storage_name: String.t() | nil
        }
end
