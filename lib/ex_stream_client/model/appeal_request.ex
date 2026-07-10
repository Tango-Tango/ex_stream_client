defmodule ExStreamClient.Model.AppealRequest do
  @moduledoc "Schema representing a AppealRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:appeal_reason, :entity_id, :entity_type]
  defstruct [:appeal_reason, :attachments, :entity_id, :entity_type, :user, :user_id]
  @nested_components user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          appeal_reason: String.t(),
          attachments: [String.t()] | nil,
          entity_id: String.t(),
          entity_type: String.t(),
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
