defmodule ExStreamClient.Model.UserBannedEvent do
  @moduledoc "Schema representing a UserBannedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:channel_id, :channel_type, :cid, :created_at, :created_by, :shadow, :type]
  defstruct [
    :channel_id,
    :channel_type,
    :cid,
    :created_at,
    :created_by,
    :expiration,
    :reason,
    :shadow,
    :team,
    :type,
    :user
  ]

  @nested_components created_at: :datetime,
                     created_by: ExStreamClient.Model.User,
                     expiration: :datetime,
                     user: ExStreamClient.Model.User
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel_id: String.t(),
          channel_type: String.t(),
          cid: String.t(),
          created_at: DateTime.t() | integer() | String.t(),
          created_by: ExStreamClient.Model.User.t(),
          expiration: (DateTime.t() | integer() | String.t()) | nil,
          reason: String.t() | nil,
          shadow: boolean(),
          team: String.t() | nil,
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end
