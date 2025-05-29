defmodule ExStreamClient.Model.ExportChannelsRequest do
  @moduledoc "Schema representing a ExportChannelsRequest"
  use ExStreamClient.Jason
  @enforce_keys [:channels]
  defstruct [
    :version,
    :export_users,
    :channels,
    :clear_deleted_message_text,
    :include_soft_deleted_channels,
    :include_truncated_messages
  ]

  @type t :: %__MODULE__{
          version: String.t() | nil,
          export_users: boolean() | nil,
          channels: [ExStreamClient.Model.ChannelExport.t()],
          clear_deleted_message_text: boolean() | nil,
          include_soft_deleted_channels: boolean() | nil,
          include_truncated_messages: boolean() | nil
        }
end