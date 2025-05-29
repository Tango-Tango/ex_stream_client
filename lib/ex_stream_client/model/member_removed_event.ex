defmodule ExStreamClient.Model.MemberRemovedEvent do
  @moduledoc "Schema representing a MemberRemovedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:channel_id, :channel_type, :cid, :created_at, :type]
  defstruct [:channel_id, :channel_type, :cid, :created_at, :member, :type, :user]

  @type t :: %__MODULE__{
          channel_id: String.t(),
          channel_type: String.t(),
          cid: String.t(),
          created_at: float(),
          member: ExStreamClient.Model.ChannelMember.t() | nil,
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end