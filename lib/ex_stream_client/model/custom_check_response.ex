defmodule ExStreamClient.Model.CustomCheckResponse do
  @moduledoc "Schema representing a CustomCheckResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :id, :status]
  defstruct [:id, :status, :item, :duration]

  @type t :: %__MODULE__{
          id: String.t(),
          status: String.t(),
          item: ExStreamClient.Model.ReviewQueueItemResponse.t() | nil,
          duration: String.t()
        }
end