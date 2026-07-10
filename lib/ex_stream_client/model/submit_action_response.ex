defmodule ExStreamClient.Model.SubmitActionResponse do
  @moduledoc "Schema representing a SubmitActionResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration]
  defstruct [:appeal_item, :duration, :item]

  @nested_components appeal_item: ExStreamClient.Model.AppealItemResponse,
                     item: ExStreamClient.Model.ReviewQueueItemResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          appeal_item: ExStreamClient.Model.AppealItemResponse.t() | nil,
          duration: String.t(),
          item: ExStreamClient.Model.ReviewQueueItemResponse.t() | nil
        }
end
