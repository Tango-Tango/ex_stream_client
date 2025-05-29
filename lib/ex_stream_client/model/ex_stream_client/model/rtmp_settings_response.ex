defmodule ExStreamClient.Model.RTMPSettingsResponse do
  @moduledoc "Schema representing a RTMPSettingsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:enabled, :layout, :quality]
  defstruct [:enabled, :quality, :layout]

  @type t :: %__MODULE__{
          enabled: boolean(),
          quality: String.t(),
          layout: ExStreamClient.Model.LayoutSettingsResponse.t()
        }
end