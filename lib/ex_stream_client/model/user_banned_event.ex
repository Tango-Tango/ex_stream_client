defmodule ExStreamClient.Model.UserBannedEvent do
  @moduledoc "Schema representing a UserBannedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :custom, :type, :user]
  defstruct [
    :channel_custom,
    :channel_id,
    :channel_member_count,
    :channel_message_count,
    :channel_type,
    :cid,
    :created_at,
    :created_by,
    :custom,
    :expiration,
    :reason,
    :received_at,
    :shadow,
    :team,
    :total_bans,
    :type,
    :user
  ]

  @nested_components created_at: :datetime,
                     created_by: ExStreamClient.Model.UserResponseCommonFields,
                     expiration: :datetime,
                     received_at: :datetime,
                     user: ExStreamClient.Model.UserResponseCommonFields
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel_custom: %{optional(String.t()) => any()} | nil,
          channel_id: String.t() | nil,
          channel_member_count: integer() | nil,
          channel_message_count: integer() | nil,
          channel_type: String.t() | nil,
          cid: String.t() | nil,
          created_at: DateTime.t() | integer() | String.t(),
          created_by: ExStreamClient.Model.UserResponseCommonFields.t() | nil,
          custom: %{optional(String.t()) => any()},
          expiration: (DateTime.t() | integer() | String.t()) | nil,
          reason: String.t() | nil,
          received_at: (DateTime.t() | integer() | String.t()) | nil,
          shadow: boolean() | nil,
          team: String.t() | nil,
          total_bans: integer() | nil,
          type: String.t(),
          user: ExStreamClient.Model.UserResponseCommonFields.t()
        }
end
