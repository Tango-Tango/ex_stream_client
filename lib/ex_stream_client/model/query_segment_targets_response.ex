defmodule ExStreamClient.Model.QuerySegmentTargetsResponse do
  @moduledoc "Schema representing a QuerySegmentTargetsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :targets]
  defstruct [:duration, :next, :prev, :targets]
  @nested_components %{targets: ExStreamClient.Model.SegmentTargetResponse}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          next: String.t() | nil,
          prev: String.t() | nil,
          targets: [ExStreamClient.Model.SegmentTargetResponse.t()]
        }
end
