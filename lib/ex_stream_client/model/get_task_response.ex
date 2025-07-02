defmodule ExStreamClient.Model.GetTaskResponse do
  @moduledoc "Schema representing a GetTaskResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :duration, :status, :task_id, :updated_at]
  defstruct [:created_at, :duration, :error, :result, :status, :task_id, :updated_at]

  @nested_components created_at: :datetime,
                     error: ExStreamClient.Model.ErrorResult,
                     updated_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: DateTime.t() | integer() | String.t(),
          duration: String.t(),
          error: ExStreamClient.Model.ErrorResult.t() | nil,
          result: %{optional(String.t()) => any()} | nil,
          status: String.t(),
          task_id: String.t(),
          updated_at: DateTime.t() | integer() | String.t()
        }
end
