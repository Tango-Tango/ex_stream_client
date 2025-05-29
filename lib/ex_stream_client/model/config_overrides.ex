defmodule ExStreamClient.Model.ConfigOverrides do
  @moduledoc "Schema representing a ConfigOverrides"
  use ExStreamClient.Jason
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

  @type t :: %__MODULE__{
          blocklist: String.t() | nil,
          blocklist_behavior: (:block | :flag) | nil,
          commands: [String.t()],
          grants: map(),
          max_message_length: integer() | nil,
          quotes: boolean() | nil,
          reactions: boolean() | nil,
          replies: boolean() | nil,
          typing_events: boolean() | nil,
          uploads: boolean() | nil,
          url_enrichment: boolean() | nil
        }
end