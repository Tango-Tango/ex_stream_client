defmodule ExStreamClient.Model.ReminderNotificationEvent do
  @moduledoc "Schema representing a ReminderNotificationEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:cid, :created_at, :custom, :message_id, :type, :user_id]
  defstruct [
    :cid,
    :created_at,
    :custom,
    :message_id,
    :parent_id,
    :received_at,
    :reminder,
    :type,
    :user_id
  ]

  @nested_components created_at: :datetime,
                     received_at: :datetime,
                     reminder: ExStreamClient.Model.ReminderResponseData
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          cid: String.t(),
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          message_id: String.t(),
          parent_id: String.t() | nil,
          received_at: (DateTime.t() | integer() | String.t()) | nil,
          reminder: ExStreamClient.Model.ReminderResponseData.t() | nil,
          type: String.t(),
          user_id: String.t()
        }
end
