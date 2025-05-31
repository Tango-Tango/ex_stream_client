defmodule ExStreamClient.Model.UserUnreadReminderEvent do
  @moduledoc "Schema representing a UserUnreadReminderEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:channels, :created_at, :type]
  defstruct [:channels, :created_at, :type, :user]

  @nested_components channels: {:map, ExStreamClient.Model.ChannelMessages},
                     user: ExStreamClient.Model.User
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channels: %{optional(String.t()) => ExStreamClient.Model.ChannelMessages.t()},
          created_at: float(),
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end
