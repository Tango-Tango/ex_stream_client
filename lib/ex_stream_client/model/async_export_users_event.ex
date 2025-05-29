defmodule ExStreamClient.Model.AsyncExportUsersEvent do
  @moduledoc "Schema representing a AsyncExportUsersEvent"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :custom, :finished_at, :started_at, :task_id, :type, :url]
  defstruct [:created_at, :custom, :finished_at, :received_at, :started_at, :task_id, :type, :url]

  @type t :: %__MODULE__{
          created_at: float(),
          custom: map(),
          finished_at: float(),
          received_at: float() | nil,
          started_at: float(),
          task_id: String.t(),
          type: String.t(),
          url: String.t()
        }
end