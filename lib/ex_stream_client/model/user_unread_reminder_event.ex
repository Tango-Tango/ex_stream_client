defmodule ExStreamClient.Model.UserUnreadReminderEvent do
  @moduledoc "Schema representing a UserUnreadReminderEvent"
  use ExStreamClient.Jason
  @enforce_keys [:channels, :created_at, :type]
  defstruct [:type, :user, :created_at, :channels]

  @type t :: %__MODULE__{
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil,
          created_at: float(),
          channels: map()
        }
end