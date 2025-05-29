defmodule ExStreamClient.Model.UserUnreadReminderEvent do
  @moduledoc "Schema representing a UserUnreadReminderEvent"
  use ExStreamClient.Jason
  @enforce_keys [:channels, :created_at, :type]
  defstruct [:channels, :created_at, :type, :user]

  @type t :: %__MODULE__{
          channels: map(),
          created_at: float(),
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end