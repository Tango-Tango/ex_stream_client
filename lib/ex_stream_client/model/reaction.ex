defmodule ExStreamClient.Model.Reaction do
  @moduledoc "Schema representing a Reaction"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:activity_id, :created_at, :kind, :updated_at, :user_id]
  defstruct [
    :activity_id,
    :children_counts,
    :created_at,
    :data,
    :deleted_at,
    :id,
    :kind,
    :latest_children,
    :moderation,
    :own_children,
    :parent,
    :score,
    :target_feeds,
    :target_feeds_extra_data,
    :updated_at,
    :user,
    :user_id
  ]

  @nested_components created_at: :datetime,
                     deleted_at: :datetime,
                     latest_children: {:map, {:array, ExStreamClient.Model.Reaction}},
                     own_children: {:map, {:array, ExStreamClient.Model.Reaction}},
                     updated_at: :datetime,
                     user: ExStreamClient.Model.User
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          activity_id: String.t(),
          children_counts: %{optional(String.t()) => any()} | nil,
          created_at: DateTime.t() | integer() | String.t(),
          data: %{optional(String.t()) => any()} | nil,
          deleted_at: (DateTime.t() | integer() | String.t()) | nil,
          id: String.t() | nil,
          kind: String.t(),
          latest_children: %{optional(String.t()) => [ExStreamClient.Model.Reaction.t()]} | nil,
          moderation: %{optional(String.t()) => any()} | nil,
          own_children: %{optional(String.t()) => [ExStreamClient.Model.Reaction.t()]} | nil,
          parent: String.t() | nil,
          score: float() | nil,
          target_feeds: [String.t()] | nil,
          target_feeds_extra_data: %{optional(String.t()) => any()} | nil,
          updated_at: DateTime.t() | integer() | String.t(),
          user: ExStreamClient.Model.User.t() | nil,
          user_id: String.t()
        }
end
