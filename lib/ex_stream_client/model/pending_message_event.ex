defmodule ExStreamClient.Model.PendingMessageEvent do
  @moduledoc "Schema representing a PendingMessageEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :custom, :method, :type]
  defstruct [
    :channel,
    :created_at,
    :custom,
    :message,
    :metadata,
    :method,
    :received_at,
    :type,
    :user
  ]

  @nested_components channel: ExStreamClient.Model.ChannelResponse,
                     created_at: :datetime,
                     message: ExStreamClient.Model.MessageResponse,
                     received_at: :datetime,
                     user: ExStreamClient.Model.UserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          message: ExStreamClient.Model.MessageResponse.t() | nil,
          metadata: %{optional(String.t()) => String.t()} | nil,
          method: String.t(),
          received_at: (DateTime.t() | integer() | String.t()) | nil,
          type: String.t(),
          user: ExStreamClient.Model.UserResponse.t() | nil
        }
end
