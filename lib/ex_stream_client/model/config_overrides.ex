defmodule ExStreamClient.Model.ConfigOverrides do
  @moduledoc "Schema representing a ConfigOverrides"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:commands, :grants]
  defstruct [
    :blocklist,
    :blocklist_behavior,
    :commands,
    :grants,
    :max_message_length,
    :quotes,
    :reactions,
    :replies,
    :shared_locations,
    :typing_events,
    :uploads,
    :url_enrichment,
    :user_message_reminders
  ]

  @nested_components blocklist_behavior: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          blocklist: String.t() | nil,
          blocklist_behavior: (:block | :flag) | nil,
          commands: [String.t()],
          grants: %{optional(String.t()) => [String.t()]},
          max_message_length: integer() | nil,
          quotes: boolean() | nil,
          reactions: boolean() | nil,
          replies: boolean() | nil,
          shared_locations: boolean() | nil,
          typing_events: boolean() | nil,
          uploads: boolean() | nil,
          url_enrichment: boolean() | nil,
          user_message_reminders: boolean() | nil
        }
end
