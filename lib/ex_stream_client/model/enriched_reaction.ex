defmodule ExStreamClient.Model.EnrichedReaction do
  @moduledoc "Schema representing a EnrichedReaction"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
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

  @nested_components created_at: ExStreamClient.Model.Time,
                     latest_children: {:map, {:array, ExStreamClient.Model.EnrichedReaction}},
                     own_children: {:map, {:array, ExStreamClient.Model.EnrichedReaction}},
                     updated_at: ExStreamClient.Model.Time,
                     user: ExStreamClient.Model.Data
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          activity_id: String.t(),
          children_counts: %{optional(String.t()) => integer()} | nil,
          created_at: ExStreamClient.Model.Time.t() | nil,
          data: %{optional(String.t()) => any()} | nil,
          id: String.t() | nil,
          kind: String.t(),
          latest_children:
            %{optional(String.t()) => [ExStreamClient.Model.EnrichedReaction.t()]} | nil,
          own_children:
            %{optional(String.t()) => [ExStreamClient.Model.EnrichedReaction.t()]} | nil,
          parent: String.t() | nil,
          target_feeds: [String.t()] | nil,
          updated_at: ExStreamClient.Model.Time.t() | nil,
          user: ExStreamClient.Model.Data.t() | nil,
          user_id: String.t()
        }
end
