defmodule ExStreamClient.Model.AsyncExportErrorEvent do
  @moduledoc "Schema representing a AsyncExportErrorEvent"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :custom, :error, :finished_at, :started_at, :task_id, :type]
  defstruct [
    :created_at,
    :custom,
    :error,
    :finished_at,
    :received_at,
    :started_at,
    :task_id,
    :type
  ]

  @type t :: %__MODULE__{
          created_at: float(),
          custom: map(),
          error: String.t(),
          finished_at: float(),
          received_at: float() | nil,
          started_at: float(),
          task_id: String.t(),
          type: String.t()
        }
end