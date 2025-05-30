defmodule ExStreamClient.Model.EnrichedReaction do
  @moduledoc "Schema representing a EnrichedReaction"
  use ExStreamClient.Jason
  @enforce_keys [:activity_id, :kind, :user_id]
  defstruct [
    :activity_id,
    :children_counts,
    :created_at,
    :data,
    :id,
    :kind,
    :latest_children,
    :own_children,
    :parent,
    :target_feeds,
    :updated_at,
    :user,
    :user_id
  ]

  @nested_components %{
    user: ExStreamClient.Model.Data,
    created_at: ExStreamClient.Model.Time,
    updated_at: ExStreamClient.Model.Time
  }
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          activity_id: String.t(),
          children_counts: map() | nil,
          created_at: ExStreamClient.Model.Time.t() | nil,
          data: map() | nil,
          id: String.t() | nil,
          kind: String.t(),
          latest_children: map() | nil,
          own_children: map() | nil,
          parent: String.t() | nil,
          target_feeds: [String.t()] | nil,
          updated_at: ExStreamClient.Model.Time.t() | nil,
          user: ExStreamClient.Model.Data.t() | nil,
          user_id: String.t()
        }
end
