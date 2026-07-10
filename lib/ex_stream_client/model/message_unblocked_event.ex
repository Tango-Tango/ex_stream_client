defmodule ExStreamClient.Model.MessageUnblockedEvent do
  @moduledoc "Schema representing a MessageUnblockedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :custom, :message, :message_id, :type]
  defstruct [:cid, :created_at, :custom, :message, :message_id, :received_at, :type, :user]

  @nested_components created_at: :datetime,
                     message: ExStreamClient.Model.MessageResponse,
                     received_at: :datetime,
                     user: ExStreamClient.Model.UserResponseCommonFields
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          cid: String.t() | nil,
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          message: ExStreamClient.Model.MessageResponse.t(),
          message_id: String.t(),
          received_at: (DateTime.t() | integer() | String.t()) | nil,
          type: String.t(),
          user: ExStreamClient.Model.UserResponseCommonFields.t() | nil
        }
end
