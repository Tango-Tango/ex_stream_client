defmodule ExStreamClient.Model.PendingMessageResponse do
  @moduledoc "Schema representing a PendingMessageResponse"
  use ExStreamClient.Jason
  defstruct [:message, :user, :metadata, :channel]

  @type t :: %__MODULE__{
          message: ExStreamClient.Model.MessageResponse.t() | nil,
          user: ExStreamClient.Model.UserResponse.t() | nil,
          metadata: map() | nil,
          channel: ExStreamClient.Model.ChannelResponse.t() | nil
        }
end