defmodule ExStreamClient.Model.FrameRecordingEgressConfig do
  @moduledoc "Schema representing a FrameRecordingEgressConfig"
  use ExStreamClient.Jason
  defstruct [:capture_interval_in_seconds, :quality, :external_storage, :storage_name]

  @type t :: %__MODULE__{
          capture_interval_in_seconds: integer() | nil,
          quality: ExStreamClient.Model.Quality.t() | nil,
          external_storage: ExStreamClient.Model.ExternalStorage.t() | nil,
          storage_name: String.t() | nil
        }
end