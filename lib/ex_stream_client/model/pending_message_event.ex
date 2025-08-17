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

  @nested_components channel: ExStreamClient.Model.Channel,
                     created_at: :datetime,
                     message: ExStreamClient.Model.Message,
                     received_at: :datetime,
                     user: ExStreamClient.Model.User
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.Channel.t() | nil,
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          message: ExStreamClient.Model.Message.t() | nil,
          metadata: %{optional(String.t()) => String.t()} | nil,
          method: String.t(),
          received_at: (DateTime.t() | integer() | String.t()) | nil,
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end
