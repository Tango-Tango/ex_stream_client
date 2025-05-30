defmodule ExStreamClient.Model.MuteChannelRequest do
  @moduledoc "Schema representing a MuteChannelRequest"
  use ExStreamClient.Jason
  defstruct [:channel_cids, :expiration, :user, :user_id]
  @nested_components user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel_cids: [String.t()] | nil,
          expiration: integer() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
