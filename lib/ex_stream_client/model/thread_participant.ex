defmodule ExStreamClient.Model.ThreadParticipant do
  @moduledoc "Schema representing a ThreadParticipant"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
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

  @nested_components created_at: :datetime,
                     last_read_at: :datetime,
                     last_thread_message_at: :datetime,
                     left_thread_at: :datetime,
                     user: ExStreamClient.Model.UserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          app_pk: integer(),
          channel_cid: String.t(),
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          last_read_at: DateTime.t() | integer() | String.t(),
          last_thread_message_at: (DateTime.t() | integer() | String.t()) | nil,
          left_thread_at: (DateTime.t() | integer() | String.t()) | nil,
          thread_id: String.t() | nil,
          user: ExStreamClient.Model.UserResponse.t() | nil,
          user_id: String.t() | nil
        }
end
