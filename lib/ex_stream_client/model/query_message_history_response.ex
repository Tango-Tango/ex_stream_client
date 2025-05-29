defmodule ExStreamClient.Model.QueryMessageHistoryResponse do
  @moduledoc "Schema representing a QueryMessageHistoryResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :message_history]
  defstruct [:next, :prev, :duration, :message_history]

  @type t :: %__MODULE__{
          next: String.t() | nil,
          prev: String.t() | nil,
          duration: String.t(),
          message_history: [ExStreamClient.Model.MessageHistoryEntryResponse.t()]
        }
end