defmodule ExStreamClient.Model.UpdateReminderResponse do
  @moduledoc "Schema representing a UpdateReminderResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :reminder]
  defstruct [:duration, :reminder]
  @nested_components reminder: ExStreamClient.Model.ReminderResponseData
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          reminder: ExStreamClient.Model.ReminderResponseData.t()
        }
end
