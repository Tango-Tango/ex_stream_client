defmodule ExStreamClient.Model.CheckResponse do
  @moduledoc "Schema representing a CheckResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :recommended_action, :status]
  defstruct [:duration, :item, :recommended_action, :status, :task_id]
  @nested_components %{item: ExStreamClient.Model.ReviewQueueItem}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          item: ExStreamClient.Model.ReviewQueueItem.t() | nil,
          recommended_action: String.t(),
          status: String.t(),
          task_id: String.t() | nil
        }
end
