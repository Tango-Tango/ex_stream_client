defmodule ExStreamClient.Model.CampaignResponse do
  @moduledoc "Schema representing a CampaignResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

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

  @nested_components channel_template: ExStreamClient.Model.CampaignChannelTemplate,
                     created_at: :datetime,
                     message_template: ExStreamClient.Model.CampaignMessageTemplate,
                     scheduled_for: :datetime,
                     segments: ExStreamClient.Model.Segment,
                     sender: ExStreamClient.Model.UserResponse,
                     stats: ExStreamClient.Model.CampaignStatsResponse,
                     stop_at: :datetime,
                     updated_at: :datetime,
                     users: ExStreamClient.Model.UserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel_template: ExStreamClient.Model.CampaignChannelTemplate.t() | nil,
          create_channels: boolean(),
          created_at: DateTime.t() | integer() | String.t(),
          description: String.t(),
          id: String.t(),
          message_template: ExStreamClient.Model.CampaignMessageTemplate.t() | nil,
          name: String.t(),
          scheduled_for: (DateTime.t() | integer() | String.t()) | nil,
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
          stop_at: (DateTime.t() | integer() | String.t()) | nil,
          updated_at: DateTime.t() | integer() | String.t(),
          user_ids: [String.t()],
          users: [ExStreamClient.Model.UserResponse.t()]
        }
end
