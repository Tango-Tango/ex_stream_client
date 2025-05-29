defmodule ExStreamClient.Model.QuerySegmentsResponse do
  @moduledoc "Schema representing a QuerySegmentsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :segments]
  defstruct [:next, :prev, :duration, :segments]

  @type t :: %__MODULE__{
          next: String.t() | nil,
          prev: String.t() | nil,
          duration: String.t(),
          segments: [ExStreamClient.Model.SegmentResponse.t()]
        }
end