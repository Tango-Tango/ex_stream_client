defmodule ExStreamClient.Model.RTMPSettings do
  @moduledoc "Schema representing a RTMPSettings"
  use ExStreamClient.Jason
  @enforce_keys [:enabled]
  defstruct [:enabled, :location, :layout, :quality_name]

  @type t :: %__MODULE__{
          enabled: boolean(),
          location: ExStreamClient.Model.RTMPLocation.t() | nil,
          layout: ExStreamClient.Model.LayoutSettings.t() | nil,
          quality_name: String.t() | nil
        }
end