defmodule ExStreamClient.Model.QuerySegmentsResponse do
  @moduledoc "Schema representing a QuerySegmentsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :segments]
  defstruct [:duration, :next, :prev, :segments]
  @nested_components %{segments: ExStreamClient.Model.SegmentResponse}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          next: String.t() | nil,
          prev: String.t() | nil,
          segments: [ExStreamClient.Model.SegmentResponse.t()]
        }
end
