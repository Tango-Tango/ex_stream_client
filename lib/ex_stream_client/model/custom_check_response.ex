defmodule ExStreamClient.Model.CustomCheckResponse do
  @moduledoc "Schema representing a CustomCheckResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :id, :status]
  defstruct [:duration, :id, :item, :status]
  @nested_components item: ExStreamClient.Model.ReviewQueueItemResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          id: String.t(),
          item: ExStreamClient.Model.ReviewQueueItemResponse.t() | nil,
          status: String.t()
        }
end
