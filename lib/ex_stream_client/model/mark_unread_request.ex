defmodule ExStreamClient.Model.MarkUnreadRequest do
  @moduledoc "Schema representing a MarkUnreadRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:message_id, :message_timestamp, :thread_id, :user, :user_id]
  @nested_components message_timestamp: :datetime, user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          message_id: String.t() | nil,
          message_timestamp: (DateTime.t() | integer() | String.t()) | nil,
          thread_id: String.t() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
