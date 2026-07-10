defmodule ExStreamClient.Model.BanActionRequestPayload do
  @moduledoc "Schema representing a BanActionRequestPayload"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  defstruct [
    :ban_from_future_channels,
    :channel_ban_only,
    :channel_cid,
    :delete_messages,
    :ip_ban,
    :reason,
    :shadow,
    :target_user_id,
    :timeout
  ]

  @nested_components delete_messages: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          ban_from_future_channels: boolean() | nil,
          channel_ban_only: boolean() | nil,
          channel_cid: String.t() | nil,
          delete_messages: (:hard | :pruning | :soft) | nil,
          ip_ban: boolean() | nil,
          reason: String.t() | nil,
          shadow: boolean() | nil,
          target_user_id: String.t() | nil,
          timeout: integer() | nil
        }
end
