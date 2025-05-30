defmodule ExStreamClient.Model.RTMPSettingsResponse do
  @moduledoc "Schema representing a RTMPSettingsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:enabled, :layout, :quality]
  defstruct [:enabled, :layout, :quality]
  @nested_components %{layout: ExStreamClient.Model.LayoutSettingsResponse}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          enabled: boolean(),
          layout: ExStreamClient.Model.LayoutSettingsResponse.t(),
          quality: String.t()
        }
end
