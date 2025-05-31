defmodule ExStreamClient.Model.GetSegmentResponse do
  @moduledoc "Schema representing a GetSegmentResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration]
  defstruct [:duration, :segment]
  @nested_components segment: ExStreamClient.Model.SegmentResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          segment: ExStreamClient.Model.SegmentResponse.t() | nil
        }
end
