defmodule ExStreamClient.Model.ChatPreferencesResponse do
  @moduledoc "Schema representing a ChatPreferencesResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  defstruct [
    :channel_mentions,
    :default_preference,
    :direct_mentions,
    :group_mentions,
    :here_mentions,
    :role_mentions,
    :thread_replies
  ]

  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel_mentions: String.t() | nil,
          default_preference: String.t() | nil,
          direct_mentions: String.t() | nil,
          group_mentions: String.t() | nil,
          here_mentions: String.t() | nil,
          role_mentions: String.t() | nil,
          thread_replies: String.t() | nil
        }
end
