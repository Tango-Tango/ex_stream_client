defmodule ExStreamClient.Model.AsyncBulkImageModerationEvent do
  @moduledoc "Schema representing a AsyncBulkImageModerationEvent"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :custom, :finished_at, :started_at, :task_id, :type, :url]
  defstruct [:type, :started_at, :url, :custom, :created_at, :received_at, :task_id, :finished_at]

  @type t :: %__MODULE__{
          type: String.t(),
          started_at: float(),
          url: String.t(),
          custom: map(),
          created_at: float(),
          received_at: float() | nil,
          task_id: String.t(),
          finished_at: float()
        }
end