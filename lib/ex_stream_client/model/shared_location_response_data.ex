defmodule ExStreamClient.Model.SharedLocationResponseData do
  @moduledoc "Schema representing a SharedLocationResponseData"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  @enforce_keys [
    :channel_cid,
    :created_at,
    :created_by_device_id,
    :latitude,
    :longitude,
    :message_id,
    :updated_at,
    :user_id
  ]
  defstruct [
    :channel,
    :channel_cid,
    :created_at,
    :created_by_device_id,
    :end_at,
    :latitude,
    :longitude,
    :message,
    :message_id,
    :updated_at,
    :user_id
  ]

  @nested_components channel: ExStreamClient.Model.ChannelResponse,
                     created_at: :datetime,
                     end_at: :datetime,
                     message: ExStreamClient.Model.MessageResponse,
                     updated_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.ChannelResponse.t() | nil,
          channel_cid: String.t(),
          created_at: DateTime.t() | integer() | String.t(),
          created_by_device_id: String.t(),
          end_at: (DateTime.t() | integer() | String.t()) | nil,
          latitude: float(),
          longitude: float(),
          message: ExStreamClient.Model.MessageResponse.t() | nil,
          message_id: String.t(),
          updated_at: DateTime.t() | integer() | String.t(),
          user_id: String.t()
        }
end
