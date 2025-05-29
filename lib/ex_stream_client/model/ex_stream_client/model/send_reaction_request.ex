defmodule ExStreamClient.Model.SendReactionRequest do
  @moduledoc "Schema representing a SendReactionRequest"
  use ExStreamClient.Jason
  @enforce_keys [:reaction]
  defstruct [:skip_push, :reaction, :enforce_unique]

  @type t :: %__MODULE__{
          skip_push: boolean() | nil,
          reaction: ExStreamClient.Model.ReactionRequest.t(),
          enforce_unique: boolean() | nil
        }
end