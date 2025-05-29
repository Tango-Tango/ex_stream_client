defmodule ExStreamClient.Model.CallResponse do
  @moduledoc "Schema representing a CallResponse"
  use ExStreamClient.Jason

  @enforce_keys [
    :backstage,
    :blocked_user_ids,
    :captioning,
    :cid,
    :created_at,
    :created_by,
    :current_session_id,
    :custom,
    :egress,
    :id,
    :ingress,
    :recording,
    :settings,
    :transcribing,
    :type,
    :updated_at
  ]
  defstruct [
    :id,
    :session,
    :type,
    :custom,
    :team,
    :created_at,
    :created_by,
    :cid,
    :updated_at,
    :join_ahead_time_seconds,
    :blocked_user_ids,
    :ended_at,
    :backstage,
    :recording,
    :thumbnails,
    :captioning,
    :current_session_id,
    :egress,
    :ingress,
    :settings,
    :transcribing,
    :channel_cid,
    :starts_at
  ]

  @type t :: %__MODULE__{
          id: String.t(),
          session: ExStreamClient.Model.CallSessionResponse.t() | nil,
          type: String.t(),
          custom: map(),
          team: String.t() | nil,
          created_at: float(),
          created_by: ExStreamClient.Model.UserResponse.t(),
          cid: String.t(),
          updated_at: float(),
          join_ahead_time_seconds: integer() | nil,
          blocked_user_ids: [String.t()],
          ended_at: float() | nil,
          backstage: boolean(),
          recording: boolean(),
          thumbnails: ExStreamClient.Model.ThumbnailResponse.t() | nil,
          captioning: boolean(),
          current_session_id: String.t(),
          egress: ExStreamClient.Model.EgressResponse.t(),
          ingress: ExStreamClient.Model.CallIngressResponse.t(),
          settings: ExStreamClient.Model.CallSettingsResponse.t(),
          transcribing: boolean(),
          channel_cid: String.t() | nil,
          starts_at: float() | nil
        }
end