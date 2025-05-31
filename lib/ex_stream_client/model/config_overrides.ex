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
    :typing_events,
    :uploads,
    :url_enrichment
  ]

  @nested_components blocklist_behavior: :atom
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
          typing_events: boolean() | nil,
          uploads: boolean() | nil,
          url_enrichment: boolean() | nil
        }
end
