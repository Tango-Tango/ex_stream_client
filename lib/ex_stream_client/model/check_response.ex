defmodule ExStreamClient.Model.CheckResponse do
  @moduledoc "Schema representing a CheckResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :recommended_action, :status]
  defstruct [:status, :item, :duration, :task_id, :recommended_action]

  @type t :: %__MODULE__{
          status: String.t(),
          item: ExStreamClient.Model.ReviewQueueItem.t() | nil,
          duration: String.t(),
          task_id: String.t() | nil,
          recommended_action: String.t()
        }
end