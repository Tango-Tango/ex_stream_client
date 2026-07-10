defmodule ExStreamClient.Model.ChannelBatchMemberRequest do
  @moduledoc "Schema representing a ChannelBatchMemberRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:user_id]
  defstruct [:channel_role, :user_id]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{channel_role: String.t() | nil, user_id: String.t()}
end
