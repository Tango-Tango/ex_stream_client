defmodule ExStreamClient.Model.CreateCampaignRequest do
  @moduledoc "Schema representing a CreateCampaignRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:message_template, :sender_id]
  defstruct [
    :channel_template,
    :create_channels,
    :description,
    :id,
    :message_template,
    :name,
    :segment_ids,
    :sender_id,
    :sender_mode,
    :sender_visibility,
    :show_channels,
    :skip_push,
    :skip_webhook,
    :user_ids
  ]

  @nested_components channel_template: ExStreamClient.Model.CampaignChannelTemplate,
                     message_template: ExStreamClient.Model.CampaignMessageTemplate,
                     sender_mode: :enum,
                     sender_visibility: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel_template: ExStreamClient.Model.CampaignChannelTemplate.t() | nil,
          create_channels: boolean() | nil,
          description: String.t() | nil,
          id: String.t() | nil,
          message_template: ExStreamClient.Model.CampaignMessageTemplate.t(),
          name: String.t() | nil,
          segment_ids: [String.t()] | nil,
          sender_id: String.t(),
          sender_mode: (:include | :exclude) | nil,
          sender_visibility: (:archived | :hidden) | nil,
          show_channels: boolean() | nil,
          skip_push: boolean() | nil,
          skip_webhook: boolean() | nil,
          user_ids: [String.t()] | nil
        }
end
