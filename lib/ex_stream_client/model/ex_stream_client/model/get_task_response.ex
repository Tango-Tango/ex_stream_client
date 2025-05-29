defmodule ExStreamClient.Model.GetTaskResponse do
  @moduledoc "Schema representing a GetTaskResponse"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :duration, :status, :task_id, :updated_at]
  defstruct [:error, :status, :result, :duration, :created_at, :updated_at, :task_id]

  @type t :: %__MODULE__{
          error: ExStreamClient.Model.ErrorResult.t() | nil,
          status: String.t(),
          result: map() | nil,
          duration: String.t(),
          created_at: float(),
          updated_at: float(),
          task_id: String.t()
        }
end