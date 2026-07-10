defmodule ExStreamClient.Model.ChatPreferencesInput do
  @moduledoc "Schema representing a ChatPreferencesInput"
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

  @nested_components channel_mentions: :enum,
                     default_preference: :enum,
                     direct_mentions: :enum,
                     group_mentions: :enum,
                     here_mentions: :enum,
                     role_mentions: :enum,
                     thread_replies: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel_mentions: (:none | :all) | nil,
          default_preference: (:none | :all) | nil,
          direct_mentions: (:none | :all) | nil,
          group_mentions: (:none | :all) | nil,
          here_mentions: (:none | :all) | nil,
          role_mentions: (:none | :all) | nil,
          thread_replies: (:none | :all) | nil
        }
end
