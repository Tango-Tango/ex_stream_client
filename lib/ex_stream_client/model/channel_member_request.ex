defmodule ExStreamClient.Model.ChannelMemberRequest do
  @moduledoc "Schema representing a ChannelMemberRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:user_id]
  defstruct [:channel_role, :custom, :user, :user_id]
  @nested_components user: ExStreamClient.Model.UserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel_role: String.t() | nil,
          custom: %{optional(String.t()) => any()} | nil,
          user: ExStreamClient.Model.UserResponse.t() | nil,
          user_id: String.t()
        }
end
