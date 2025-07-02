defmodule ExStreamClient.Tools.Spec.Overrides do
  def model_overrides(),
    do: %{
      "MessageNewEvent" => %{
        additional_fields: [
          %{name: "channel", type: {:component, "Channel"}, required: false},
          %{name: "channel_custom", type: {:map, :any}, required: false},
          %{name: "channel_last_message_at", type: "string", required: false},
          %{name: "channel_member_count", type: "integer", required: false},
          %{name: "members", type: {:array, {:component, "ChannelMember"}}, required: false},
          %{name: "message_id", type: "string", required: false}
        ]
      },
      "User" => %{
        additional_fields: [
          %{name: "channel_last_read_at", type: "string", required: false},
          %{name: "channel_unread_count", type: "integer", required: false},
          %{name: "unread_thread_messages", type: "integer", required: false}
        ]
      }
    }
end
