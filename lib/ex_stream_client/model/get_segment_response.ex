defmodule ExStreamClient.Model.GetSegmentResponse do
  @moduledoc "Schema representing a GetSegmentResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration, :segment]

  @type t :: %__MODULE__{
          duration: String.t(),
          segment: ExStreamClient.Model.SegmentResponse.t() | nil
        }
end