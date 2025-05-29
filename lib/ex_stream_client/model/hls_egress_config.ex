defmodule ExStreamClient.Model.HLSEgressConfig do
  @moduledoc "Schema representing a HLSEgressConfig"
  use ExStreamClient.Jason
  defstruct [:composite_app_settings, :playlist_url, :qualities, :start_unix_nano]

  @type t :: %__MODULE__{
          composite_app_settings: ExStreamClient.Model.CompositeAppSettings.t() | nil,
          playlist_url: String.t() | nil,
          qualities: [ExStreamClient.Model.Quality.t()] | nil,
          start_unix_nano: integer() | nil
        }
end