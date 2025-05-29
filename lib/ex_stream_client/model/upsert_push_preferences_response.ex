defmodule ExStreamClient.Model.UpsertPushPreferencesResponse do
  @moduledoc "Schema representing a UpsertPushPreferencesResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :user_channel_preferences, :user_preferences]
  defstruct [:duration, :user_channel_preferences, :user_preferences]

  @type t :: %__MODULE__{
          duration: String.t(),
          user_channel_preferences: map(),
          user_preferences: map()
        }
end