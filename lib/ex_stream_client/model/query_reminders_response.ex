defmodule ExStreamClient.Model.QueryRemindersResponse do
  @moduledoc "Schema representing a QueryRemindersResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :reminders]
  defstruct [:duration, :next, :prev, :reminders]
  @nested_components reminders: ExStreamClient.Model.ReminderResponseData
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          next: String.t() | nil,
          prev: String.t() | nil,
          reminders: [ExStreamClient.Model.ReminderResponseData.t()]
        }
end
