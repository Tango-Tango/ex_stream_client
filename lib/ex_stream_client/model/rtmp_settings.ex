defmodule ExStreamClient.Model.RTMPSettings do
  @moduledoc "Schema representing a RTMPSettings"
  use ExStreamClient.Jason
  @enforce_keys [:enabled]
  defstruct [:enabled, :layout, :location, :quality_name]

  @type t :: %__MODULE__{
          enabled: boolean(),
          layout: ExStreamClient.Model.LayoutSettings.t() | nil,
          location: ExStreamClient.Model.RTMPLocation.t() | nil,
          quality_name: String.t() | nil
        }
end