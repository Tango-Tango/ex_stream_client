defmodule ExStreamClient.Model.GetRepliesResponse do
  @moduledoc "Schema representing a GetRepliesResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :messages]
  defstruct [:duration, :messages]

  @type t :: %__MODULE__{
          duration: String.t(),
          messages: [ExStreamClient.Model.MessageResponse.t()]
        }
end