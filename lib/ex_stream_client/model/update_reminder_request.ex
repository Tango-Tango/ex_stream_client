defmodule ExStreamClient.Model.UpdateReminderRequest do
  @moduledoc "Schema representing a UpdateReminderRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:remind_at, :user, :user_id]
  @nested_components remind_at: :datetime, user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          remind_at: (DateTime.t() | integer() | String.t()) | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
