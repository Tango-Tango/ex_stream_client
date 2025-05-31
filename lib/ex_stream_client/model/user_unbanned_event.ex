defmodule ExStreamClient.Model.UserUnbannedEvent do
  @moduledoc "Schema representing a UserUnbannedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:channel_id, :channel_type, :cid, :created_at, :shadow, :type]
  defstruct [:channel_id, :channel_type, :cid, :created_at, :shadow, :team, :type, :user]
  @nested_components user: ExStreamClient.Model.User
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel_id: String.t(),
          channel_type: String.t(),
          cid: String.t(),
          created_at: float(),
          shadow: boolean(),
          team: String.t() | nil,
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end
