defmodule ExStreamClient.Model.GetManyMessagesResponse do
  @moduledoc "Schema representing a GetManyMessagesResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :messages]
  defstruct [:duration, :messages]

  @type t :: %__MODULE__{
          duration: String.t(),
          messages: [ExStreamClient.Model.MessageResponse.t()]
        }
end