defmodule ExStreamClient.Model.CampaignResponse do
  @moduledoc "Schema representing a CampaignResponse"
  use ExStreamClient.Jason

  @enforce_keys [
    :create_channels,
    :created_at,
    :description,
    :id,
    :name,
    :segment_ids,
    :segments,
    :sender_id,
    :sender_mode,
    :show_channels,
    :skip_push,
    :skip_webhook,
    :stats,
    :status,
    :updated_at,
    :user_ids,
    :users
  ]
  defstruct [
    :id,
    :name,
    :status,
    :description,
    :stats,
    :created_at,
    :scheduled_for,
    :stop_at,
    :updated_at,
    :skip_push,
    :users,
    :segments,
    :user_ids,
    :create_channels,
    :segment_ids,
    :sender_id,
    :sender_mode,
    :show_channels,
    :skip_webhook,
    :channel_template,
    :message_template,
    :sender
  ]

  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t(),
          status: String.t(),
          description: String.t(),
          stats: ExStreamClient.Model.CampaignStatsResponse.t(),
          created_at: float(),
          scheduled_for: float() | nil,
          stop_at: float() | nil,
          updated_at: float(),
          skip_push: boolean(),
          users: [ExStreamClient.Model.UserResponse.t()],
          segments: [ExStreamClient.Model.Segment.t()],
          user_ids: [String.t()],
          create_channels: boolean(),
          segment_ids: [String.t()],
          sender_id: String.t(),
          sender_mode: String.t(),
          show_channels: boolean(),
          skip_webhook: boolean(),
          channel_template: ExStreamClient.Model.CampaignChannelTemplate.t() | nil,
          message_template: ExStreamClient.Model.CampaignMessageTemplate.t() | nil,
          sender: ExStreamClient.Model.UserResponse.t() | nil
        }
end