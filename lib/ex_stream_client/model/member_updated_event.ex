defmodule ExStreamClient.Model.MemberUpdatedEvent do
  @moduledoc "Schema representing a MemberUpdatedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:channel_id, :channel_type, :cid, :created_at, :type]
  defstruct [:type, :member, :user, :team, :created_at, :channel_id, :channel_type, :cid]

  @type t :: %__MODULE__{
          type: String.t(),
          member: ExStreamClient.Model.ChannelMember.t() | nil,
          user: ExStreamClient.Model.User.t() | nil,
          team: String.t() | nil,
          created_at: float(),
          channel_id: String.t(),
          channel_type: String.t(),
          cid: String.t()
        }
end