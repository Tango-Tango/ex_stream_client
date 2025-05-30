defmodule ExStreamClient.Model.QueryMessageHistoryResponse do
  @moduledoc "Schema representing a QueryMessageHistoryResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :message_history]
  defstruct [:duration, :message_history, :next, :prev]
  @nested_components message_history: ExStreamClient.Model.MessageHistoryEntryResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          message_history: [ExStreamClient.Model.MessageHistoryEntryResponse.t()],
          next: String.t() | nil,
          prev: String.t() | nil
        }
end
