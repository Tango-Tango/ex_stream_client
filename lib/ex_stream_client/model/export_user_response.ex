defmodule ExStreamClient.Model.ExportUserResponse do
  @moduledoc "Schema representing a ExportUserResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration, :messages, :reactions, :user]

  @type t :: %__MODULE__{
          duration: String.t(),
          messages: [ExStreamClient.Model.MessageResponse.t()] | nil,
          reactions: [ExStreamClient.Model.ReactionResponse.t()] | nil,
          user: ExStreamClient.Model.UserResponse.t() | nil
        }
end