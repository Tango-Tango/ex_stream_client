defmodule ExStreamClient.Model.SendReactionRequest do
  @moduledoc "Schema representing a SendReactionRequest"
  use ExStreamClient.Jason
  @enforce_keys [:reaction]
  defstruct [:enforce_unique, :reaction, :skip_push]

  @type t :: %__MODULE__{
          enforce_unique: boolean() | nil,
          reaction: ExStreamClient.Model.ReactionRequest.t(),
          skip_push: boolean() | nil
        }
end