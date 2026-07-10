defmodule ExStreamClient.Model.FeedsFeedResponse do
  @moduledoc "Schema representing a FeedsFeedResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  @enforce_keys [
    :activity_count,
    :created_at,
    :created_by,
    :description,
    :feed,
    :follower_count,
    :following_count,
    :group_id,
    :id,
    :member_count,
    :name,
    :pin_count,
    :updated_at
  ]
  defstruct [
    :activity_count,
    :created_at,
    :created_by,
    :custom,
    :deleted_at,
    :description,
    :feed,
    :filter_tags,
    :follower_count,
    :following_count,
    :group_id,
    :id,
    :location,
    :member_count,
    :name,
    :pin_count,
    :updated_at,
    :visibility
  ]

  @nested_components created_at: :datetime,
                     created_by: ExStreamClient.Model.UserResponse,
                     deleted_at: :datetime,
                     location: ExStreamClient.Model.FeedsActivityLocation,
                     updated_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          activity_count: integer(),
          created_at: DateTime.t() | integer() | String.t(),
          created_by: ExStreamClient.Model.UserResponse.t(),
          custom: %{optional(String.t()) => any()} | nil,
          deleted_at: (DateTime.t() | integer() | String.t()) | nil,
          description: String.t(),
          feed: String.t(),
          filter_tags: [String.t()] | nil,
          follower_count: integer(),
          following_count: integer(),
          group_id: String.t(),
          id: String.t(),
          location: ExStreamClient.Model.FeedsActivityLocation.t() | nil,
          member_count: integer(),
          name: String.t(),
          pin_count: integer(),
          updated_at: DateTime.t() | integer() | String.t(),
          visibility: String.t() | nil
        }
end
