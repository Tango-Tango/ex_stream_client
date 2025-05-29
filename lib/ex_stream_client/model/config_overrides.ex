defmodule ExStreamClient.Model.ConfigOverrides do
  @moduledoc "Schema representing a ConfigOverrides"
  use ExStreamClient.Jason
  @enforce_keys [:commands, :grants]
  defstruct [
    :replies,
    :commands,
    :reactions,
    :max_message_length,
    :blocklist,
    :blocklist_behavior,
    :grants,
    :quotes,
    :typing_events,
    :uploads,
    :url_enrichment
  ]

  @type t :: %__MODULE__{
          replies: boolean() | nil,
          commands: [String.t()],
          reactions: boolean() | nil,
          max_message_length: integer() | nil,
          blocklist: String.t() | nil,
          blocklist_behavior: (:block | :flag) | nil,
          grants: map(),
          quotes: boolean() | nil,
          typing_events: boolean() | nil,
          uploads: boolean() | nil,
          url_enrichment: boolean() | nil
        }
end