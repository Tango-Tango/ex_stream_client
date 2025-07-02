defmodule ExStreamClient.Model.ChannelVisibleEvent do
  @moduledoc "Schema representing a ChannelVisibleEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:channel_id, :channel_type, :cid, :created_at, :type]
  defstruct [:channel_id, :channel_type, :cid, :created_at, :type, :user]
  @nested_components created_at: :datetime, user: ExStreamClient.Model.User
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel_id: String.t(),
          channel_type: String.t(),
          cid: String.t(),
          created_at: DateTime.t() | integer() | String.t(),
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end
