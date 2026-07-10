defmodule ExStreamClient.Model.AppealItemResponse do
  @moduledoc "Schema representing a AppealItemResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:appeal_reason, :created_at, :entity_id, :entity_type, :id, :status, :updated_at]
  defstruct [
    :appeal_reason,
    :attachments,
    :created_at,
    :decision_reason,
    :entity_content,
    :entity_id,
    :entity_type,
    :id,
    :status,
    :updated_at,
    :user
  ]

  @nested_components created_at: :datetime,
                     entity_content: ExStreamClient.Model.ModerationPayload,
                     updated_at: :datetime,
                     user: ExStreamClient.Model.UserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          appeal_reason: String.t(),
          attachments: [String.t()] | nil,
          created_at: DateTime.t() | integer() | String.t(),
          decision_reason: String.t() | nil,
          entity_content: ExStreamClient.Model.ModerationPayload.t() | nil,
          entity_id: String.t(),
          entity_type: String.t(),
          id: String.t(),
          status: String.t(),
          updated_at: DateTime.t() | integer() | String.t(),
          user: ExStreamClient.Model.UserResponse.t() | nil
        }
end
