defmodule ExStreamClient.Model.UserBannedEvent do
  @moduledoc "Schema representing a UserBannedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:channel_id, :channel_type, :cid, :created_at, :created_by, :shadow, :type]
  defstruct [
    :reason,
    :type,
    :user,
    :shadow,
    :team,
    :created_at,
    :created_by,
    :channel_id,
    :channel_type,
    :cid,
    :expiration
  ]

  @type t :: %__MODULE__{
          reason: String.t() | nil,
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil,
          shadow: boolean(),
          team: String.t() | nil,
          created_at: float(),
          created_by: ExStreamClient.Model.User.t(),
          channel_id: String.t(),
          channel_type: String.t(),
          cid: String.t(),
          expiration: float() | nil
        }
end