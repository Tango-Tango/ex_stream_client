defmodule ExStreamClient.Model.GetTaskResponse do
  @moduledoc "Schema representing a GetTaskResponse"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :duration, :status, :task_id, :updated_at]
  defstruct [:created_at, :duration, :error, :result, :status, :task_id, :updated_at]

  @type t :: %__MODULE__{
          created_at: float(),
          duration: String.t(),
          error: ExStreamClient.Model.ErrorResult.t() | nil,
          result: map() | nil,
          status: String.t(),
          task_id: String.t(),
          updated_at: float()
        }
end