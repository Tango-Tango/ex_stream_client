defmodule ExStreamClient.Model.ExportChannelsRequest do
  @moduledoc "Schema representing a ExportChannelsRequest"
  use ExStreamClient.Jason
  @enforce_keys [:channels]
  defstruct [
    :version,
    :channels,
    :clear_deleted_message_text,
    :export_users,
    :include_soft_deleted_channels,
    :include_truncated_messages
  ]

  @type t :: %__MODULE__{
          version: String.t() | nil,
          channels: [ExStreamClient.Model.ChannelExport.t()],
          clear_deleted_message_text: boolean() | nil,
          export_users: boolean() | nil,
          include_soft_deleted_channels: boolean() | nil,
          include_truncated_messages: boolean() | nil
        }
end