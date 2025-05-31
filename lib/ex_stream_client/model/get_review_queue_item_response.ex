defmodule ExStreamClient.Model.GetReviewQueueItemResponse do
  @moduledoc "Schema representing a GetReviewQueueItemResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration]
  defstruct [:duration, :item]
  @nested_components item: ExStreamClient.Model.ReviewQueueItemResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          item: ExStreamClient.Model.ReviewQueueItemResponse.t() | nil
        }
end
