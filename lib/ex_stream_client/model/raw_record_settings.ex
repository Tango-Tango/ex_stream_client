defmodule ExStreamClient.Model.RawRecordSettings do
  @moduledoc "Schema representing a RawRecordSettings"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:mode]
  defstruct [:audio_only, :mode]
  @nested_components mode: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{audio_only: boolean() | nil, mode: :"auto-on" | :disabled | :available}
end
