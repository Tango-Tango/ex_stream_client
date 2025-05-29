defmodule ExStreamClient.Model.SendReactionResponse do
  @moduledoc "Schema representing a SendReactionResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :message, :reaction]
  defstruct [:message, :duration, :reaction]

  @type t :: %__MODULE__{
          message: ExStreamClient.Model.MessageResponse.t(),
          duration: String.t(),
          reaction: ExStreamClient.Model.ReactionResponse.t()
        }
end