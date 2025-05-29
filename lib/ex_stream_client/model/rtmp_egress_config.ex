defmodule ExStreamClient.Model.RTMPEgressConfig do
  @moduledoc "Schema representing a RTMPEgressConfig"
  use ExStreamClient.Jason
  defstruct [:quality, :composite_app_settings, :rtmp_location]

  @type t :: %__MODULE__{
          quality: ExStreamClient.Model.Quality.t() | nil,
          composite_app_settings: ExStreamClient.Model.CompositeAppSettings.t() | nil,
          rtmp_location: String.t() | nil
        }
end