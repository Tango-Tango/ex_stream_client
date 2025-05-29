defmodule ExStreamClient.Model.EnrichedReaction do
  @moduledoc "Schema representing a EnrichedReaction"
  use ExStreamClient.Jason
  @enforce_keys [:activity_id, :kind, :user_id]
  defstruct [
    :data,
    :id,
    :parent,
    :user,
    :kind,
    :created_at,
    :user_id,
    :updated_at,
    :activity_id,
    :children_counts,
    :latest_children,
    :own_children,
    :target_feeds
  ]

  @type t :: %__MODULE__{
          data: map() | nil,
          id: String.t() | nil,
          parent: String.t() | nil,
          user: ExStreamClient.Model.Data.t() | nil,
          kind: String.t(),
          created_at: ExStreamClient.Model.Time.t() | nil,
          user_id: String.t(),
          updated_at: ExStreamClient.Model.Time.t() | nil,
          activity_id: String.t(),
          children_counts: map() | nil,
          latest_children: map() | nil,
          own_children: map() | nil,
          target_feeds: [String.t()] | nil
        }
end