defmodule ExStreamClient.Model.TruncateChannelRequest do
  @moduledoc "Schema representing a TruncateChannelRequest"
  use ExStreamClient.Jason
  defstruct [:message, :user, :user_id, :hard_delete, :skip_push, :member_ids, :truncated_at]

  @type t :: %__MODULE__{
          message: ExStreamClient.Model.MessageRequest.t() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil,
          hard_delete: boolean() | nil,
          skip_push: boolean() | nil,
          member_ids: [String.t()] | nil,
          truncated_at: float() | nil
        }
end