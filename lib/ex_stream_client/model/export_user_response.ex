defmodule ExStreamClient.Model.ExportUserResponse do
  @moduledoc "Schema representing a ExportUserResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration, :messages, :reactions, :user]

  @nested_components messages: ExStreamClient.Model.MessageResponse,
                     reactions: ExStreamClient.Model.ReactionResponse,
                     user: ExStreamClient.Model.UserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          messages: [ExStreamClient.Model.MessageResponse.t()] | nil,
          reactions: [ExStreamClient.Model.ReactionResponse.t()] | nil,
          user: ExStreamClient.Model.UserResponse.t() | nil
        }
end
