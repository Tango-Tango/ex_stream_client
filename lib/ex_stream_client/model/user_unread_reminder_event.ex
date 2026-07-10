defmodule ExStreamClient.Model.UserUnreadReminderEvent do
  @moduledoc "Schema representing a UserUnreadReminderEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:channels, :created_at, :custom, :type, :user]
  defstruct [:channels, :created_at, :custom, :received_at, :type, :user]

  @nested_components channels: {:map, ExStreamClient.Model.ChannelMessagesResponse},
                     created_at: :datetime,
                     received_at: :datetime,
                     user: ExStreamClient.Model.UserResponseCommonFields
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channels: %{optional(String.t()) => ExStreamClient.Model.ChannelMessagesResponse.t()},
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          received_at: (DateTime.t() | integer() | String.t()) | nil,
          type: String.t(),
          user: ExStreamClient.Model.UserResponseCommonFields.t()
        }
end
