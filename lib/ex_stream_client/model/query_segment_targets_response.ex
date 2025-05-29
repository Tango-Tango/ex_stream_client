defmodule ExStreamClient.Model.QuerySegmentTargetsResponse do
  @moduledoc "Schema representing a QuerySegmentTargetsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :targets]
  defstruct [:next, :prev, :targets, :duration]

  @type t :: %__MODULE__{
          next: String.t() | nil,
          prev: String.t() | nil,
          targets: [ExStreamClient.Model.SegmentTargetResponse.t()],
          duration: String.t()
        }
end