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
    :backstage,
    :blocked_user_ids,
    :captioning,
    :channel_cid,
    :cid,
    :created_at,
    :created_by,
    :current_session_id,
    :custom,
    :egress,
    :ended_at,
    :id,
    :ingress,
    :join_ahead_time_seconds,
    :recording,
    :session,
    :settings,
    :starts_at,
    :team,
    :thumbnails,
    :transcribing,
    :type,
    :updated_at
  ]

  @nested_components %{
    session: ExStreamClient.Model.CallSessionResponse,
    created_by: ExStreamClient.Model.UserResponse,
    settings: ExStreamClient.Model.CallSettingsResponse,
    egress: ExStreamClient.Model.EgressResponse,
    ingress: ExStreamClient.Model.CallIngressResponse,
    thumbnails: ExStreamClient.Model.ThumbnailResponse
  }
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          backstage: boolean(),
          blocked_user_ids: [String.t()],
          captioning: boolean(),
          channel_cid: String.t() | nil,
          cid: String.t(),
          created_at: float(),
          created_by: ExStreamClient.Model.UserResponse.t(),
          current_session_id: String.t(),
          custom: map(),
          egress: ExStreamClient.Model.EgressResponse.t(),
          ended_at: float() | nil,
          id: String.t(),
          ingress: ExStreamClient.Model.CallIngressResponse.t(),
          join_ahead_time_seconds: integer() | nil,
          recording: boolean(),
          session: ExStreamClient.Model.CallSessionResponse.t() | nil,
          settings: ExStreamClient.Model.CallSettingsResponse.t(),
          starts_at: float() | nil,
          team: String.t() | nil,
          thumbnails: ExStreamClient.Model.ThumbnailResponse.t() | nil,
          transcribing: boolean(),
          type: String.t(),
          updated_at: float()
        }
end
