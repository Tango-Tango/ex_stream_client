defmodule ExStreamClient.Model.ChannelBatchUpdateResponse do
  @moduledoc "Schema representing a ChannelBatchUpdateResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration]
  defstruct [:duration, :task_id]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{duration: String.t(), task_id: String.t() | nil}
end
