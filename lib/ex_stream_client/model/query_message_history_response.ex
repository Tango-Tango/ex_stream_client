defmodule ExStreamClient.Model.QueryMessageHistoryResponse do
  @moduledoc "Schema representing a QueryMessageHistoryResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :message_history]
  defstruct [:duration, :message_history, :next, :prev]

  @type t :: %__MODULE__{
          duration: String.t(),
          message_history: [ExStreamClient.Model.MessageHistoryEntryResponse.t()],
          next: String.t() | nil,
          prev: String.t() | nil
        }
end