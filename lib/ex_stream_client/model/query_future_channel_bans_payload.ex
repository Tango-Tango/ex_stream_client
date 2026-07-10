defmodule ExStreamClient.Model.QueryFutureChannelBansPayload do
  @moduledoc "Schema representing a QueryFutureChannelBansPayload"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:exclude_expired_bans, :limit, :offset, :target_user_id, :user, :user_id]
  @nested_components user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          exclude_expired_bans: boolean() | nil,
          limit: integer() | nil,
          offset: integer() | nil,
          target_user_id: String.t() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
