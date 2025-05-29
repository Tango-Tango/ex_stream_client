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
    :channel_template,
    :create_channels,
    :created_at,
    :description,
    :id,
    :message_template,
    :name,
    :scheduled_for,
    :segment_ids,
    :segments,
    :sender,
    :sender_id,
    :sender_mode,
    :show_channels,
    :skip_push,
    :skip_webhook,
    :stats,
    :status,
    :stop_at,
    :updated_at,
    :user_ids,
    :users
  ]

  @type t :: %__MODULE__{
          channel_template: ExStreamClient.Model.CampaignChannelTemplate.t() | nil,
          create_channels: boolean(),
          created_at: float(),
          description: String.t(),
          id: String.t(),
          message_template: ExStreamClient.Model.CampaignMessageTemplate.t() | nil,
          name: String.t(),
          scheduled_for: float() | nil,
          segment_ids: [String.t()],
          segments: [ExStreamClient.Model.Segment.t()],
          sender: ExStreamClient.Model.UserResponse.t() | nil,
          sender_id: String.t(),
          sender_mode: String.t(),
          show_channels: boolean(),
          skip_push: boolean(),
          skip_webhook: boolean(),
          stats: ExStreamClient.Model.CampaignStatsResponse.t(),
          status: String.t(),
          stop_at: float() | nil,
          updated_at: float(),
          user_ids: [String.t()],
          users: [ExStreamClient.Model.UserResponse.t()]
        }
end