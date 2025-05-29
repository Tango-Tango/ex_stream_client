defmodule ExStreamClient.Model.SendReactionResponse do
  @moduledoc "Schema representing a SendReactionResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :message, :reaction]
  defstruct [:duration, :message, :reaction]

  @type t :: %__MODULE__{
          duration: String.t(),
          message: ExStreamClient.Model.MessageResponse.t(),
          reaction: ExStreamClient.Model.ReactionResponse.t()
        }
end