defmodule ExStreamClient.Model.DeleteReactionResponse do
  @moduledoc "Schema representing a DeleteReactionResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :message, :reaction]
  defstruct [:message, :duration, :reaction]

  @type t :: %__MODULE__{
          message: ExStreamClient.Model.MessageResponse.t(),
          duration: String.t(),
          reaction: ExStreamClient.Model.ReactionResponse.t()
        }
end