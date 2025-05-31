defmodule ExStreamClient.Model.UpsertPushPreferencesResponse do
  @moduledoc "Schema representing a UpsertPushPreferencesResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :user_channel_preferences, :user_preferences]
  defstruct [:duration, :user_channel_preferences, :user_preferences]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          user_channel_preferences: map(),
          user_preferences: map()
        }
end
