defmodule ExStreamClient.Model.TruncateChannelRequest do
  @moduledoc "Schema representing a TruncateChannelRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:hard_delete, :member_ids, :message, :skip_push, :truncated_at, :user, :user_id]

  @nested_components message: ExStreamClient.Model.MessageRequest,
                     truncated_at: :datetime,
                     user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          hard_delete: boolean() | nil,
          member_ids: [String.t()] | nil,
          message: ExStreamClient.Model.MessageRequest.t() | nil,
          skip_push: boolean() | nil,
          truncated_at: (DateTime.t() | integer() | String.t()) | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
