defmodule ExStreamClient.Model.PendingMessageResponse do
  @moduledoc "Schema representing a PendingMessageResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:channel, :message, :metadata, :user]

  @nested_components channel: ExStreamClient.Model.ChannelResponse,
                     message: ExStreamClient.Model.MessageResponse,
                     user: ExStreamClient.Model.UserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          message: ExStreamClient.Model.MessageResponse.t() | nil,
          metadata: %{optional(String.t()) => String.t()} | nil,
          user: ExStreamClient.Model.UserResponse.t() | nil
        }
end
