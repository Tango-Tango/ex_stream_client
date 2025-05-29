defmodule ExStreamClient.Model.ThreadParticipant do
  @moduledoc "Schema representing a ThreadParticipant"
  use ExStreamClient.Jason
  @enforce_keys [:app_pk, :channel_cid, :created_at, :custom, :last_read_at]
  defstruct [
    :app_pk,
    :channel_cid,
    :created_at,
    :custom,
    :last_read_at,
    :last_thread_message_at,
    :left_thread_at,
    :thread_id,
    :user,
    :user_id
  ]

  @type t :: %__MODULE__{
          app_pk: integer(),
          channel_cid: String.t(),
          created_at: float(),
          custom: map(),
          last_read_at: float(),
          last_thread_message_at: float() | nil,
          left_thread_at: float() | nil,
          thread_id: String.t() | nil,
          user: ExStreamClient.Model.UserResponse.t() | nil,
          user_id: String.t() | nil
        }
end