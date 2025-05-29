defmodule ExStreamClient.Model.CustomCheckResponse do
  @moduledoc "Schema representing a CustomCheckResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :id, :status]
  defstruct [:duration, :id, :item, :status]

  @type t :: %__MODULE__{
          duration: String.t(),
          id: String.t(),
          item: ExStreamClient.Model.ReviewQueueItemResponse.t() | nil,
          status: String.t()
        }
end