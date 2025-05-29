defmodule ExStreamClient.Model.PendingMessageResponse do
  @moduledoc "Schema representing a PendingMessageResponse"
  use ExStreamClient.Jason
  defstruct [:channel, :message, :metadata, :user]

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          message: ExStreamClient.Model.MessageResponse.t() | nil,
          metadata: map() | nil,
          user: ExStreamClient.Model.UserResponse.t() | nil
        }
end