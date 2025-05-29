defmodule ExStreamClient.Model.ThreadParticipant do
  @moduledoc "Schema representing a ThreadParticipant"
  use ExStreamClient.Jason
  @enforce_keys [:app_pk, :channel_cid, :created_at, :custom, :last_read_at]
  defstruct [
    :user,
    :custom,
    :created_at,
    :user_id,
    :app_pk,
    :last_read_at,
    :thread_id,
    :channel_cid,
    :last_thread_message_at,
    :left_thread_at
  ]

  @type t :: %__MODULE__{
          user: ExStreamClient.Model.UserResponse.t() | nil,
          custom: map(),
          created_at: float(),
          user_id: String.t() | nil,
          app_pk: integer(),
          last_read_at: float(),
          thread_id: String.t() | nil,
          channel_cid: String.t(),
          last_thread_message_at: float() | nil,
          left_thread_at: float() | nil
        }
end