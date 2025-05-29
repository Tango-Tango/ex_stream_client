defmodule ExStreamClient.Model.GetSegmentResponse do
  @moduledoc "Schema representing a GetSegmentResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:segment, :duration]

  @type t :: %__MODULE__{
          segment: ExStreamClient.Model.SegmentResponse.t() | nil,
          duration: String.t()
        }
end