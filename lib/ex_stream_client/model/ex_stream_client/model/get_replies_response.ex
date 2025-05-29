defmodule ExStreamClient.Model.GetRepliesResponse do
  @moduledoc "Schema representing a GetRepliesResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :messages]
  defstruct [:messages, :duration]

  @type t :: %__MODULE__{
          messages: [ExStreamClient.Model.MessageResponse.t()],
          duration: String.t()
        }
end