defmodule ExStreamClient.Model.ThreadUpdatedEvent do
  @moduledoc "Schema representing a ThreadUpdatedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:channel_id, :channel_type, :cid, :created_at, :type]
  defstruct [:channel_id, :channel_type, :cid, :created_at, :thread, :type, :user]
  @nested_components thread: ExStreamClient.Model.ThreadResponse, user: ExStreamClient.Model.User
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel_id: String.t(),
          channel_type: String.t(),
          cid: String.t(),
          created_at: float(),
          thread: ExStreamClient.Model.ThreadResponse.t() | nil,
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end
