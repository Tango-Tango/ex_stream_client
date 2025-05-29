defmodule ExStreamClient.Model.AsyncExportErrorEvent do
  @moduledoc "Schema representing a AsyncExportErrorEvent"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :custom, :error, :finished_at, :started_at, :task_id, :type]
  defstruct [
    :error,
    :type,
    :started_at,
    :custom,
    :created_at,
    :received_at,
    :task_id,
    :finished_at
  ]

  @type t :: %__MODULE__{
          error: String.t(),
          type: String.t(),
          started_at: float(),
          custom: map(),
          created_at: float(),
          received_at: float() | nil,
          task_id: String.t(),
          finished_at: float()
        }
end