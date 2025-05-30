defmodule ExStreamClient.Model.RecordSettings do
  @moduledoc "Schema representing a RecordSettings"
  use ExStreamClient.Jason
  @enforce_keys [:mode]
  defstruct [:audio_only, :layout, :mode, :quality]
  @nested_components %{layout: ExStreamClient.Model.LayoutSettings}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          audio_only: boolean() | nil,
          layout: ExStreamClient.Model.LayoutSettings.t() | nil,
          mode: String.t(),
          quality: String.t() | nil
        }
end
