defmodule ExStreamClient.Model.ExportUserResponse do
  @moduledoc "Schema representing a ExportUserResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:messages, :user, :duration, :reactions]

  @type t :: %__MODULE__{
          messages: [ExStreamClient.Model.MessageResponse.t()] | nil,
          user: ExStreamClient.Model.UserResponse.t() | nil,
          duration: String.t(),
          reactions: [ExStreamClient.Model.ReactionResponse.t()] | nil
        }
end