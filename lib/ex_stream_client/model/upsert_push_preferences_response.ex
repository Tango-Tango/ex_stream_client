defmodule ExStreamClient.Model.UpsertPushPreferencesResponse do
  @moduledoc "Schema representing a UpsertPushPreferencesResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :user_channel_preferences, :user_preferences]
  defstruct [:duration, :user_channel_preferences, :user_preferences]
  @nested_components user_preferences: {:map, ExStreamClient.Model.PushPreferences}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          user_channel_preferences: %{
            optional(String.t()) => %{
              optional(String.t()) => ExStreamClient.Model.ChannelPushPreferences.t()
            }
          },
          user_preferences: %{optional(String.t()) => ExStreamClient.Model.PushPreferences.t()}
        }
end
