defmodule ExStreamClient.Model.ActivityMarkedEvent do
  @moduledoc "Schema representing a ActivityMarkedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:all_read, :all_seen, :created_at, :feed_id, :type, :user_id]
  defstruct [
    :all_read,
    :all_seen,
    :created_at,
    :feed_id,
    :marked_read,
    :marked_watched,
    :type,
    :user_id
  ]

  @nested_components created_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          all_read: boolean(),
          all_seen: boolean(),
          created_at: DateTime.t() | integer() | String.t(),
          feed_id: String.t(),
          marked_read: [String.t()] | nil,
          marked_watched: [String.t()] | nil,
          type: String.t(),
          user_id: String.t()
        }
end
