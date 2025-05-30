defmodule ExStreamClient.Model.QueryModerationLogsResponse do
  @moduledoc "Schema representing a QueryModerationLogsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :logs]
  defstruct [:duration, :logs, :next, :prev]
  @nested_components %{logs: ExStreamClient.Model.ActionLogResponse}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          logs: [ExStreamClient.Model.ActionLogResponse.t()],
          next: String.t() | nil,
          prev: String.t() | nil
        }
end
