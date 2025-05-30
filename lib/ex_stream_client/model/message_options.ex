defmodule ExStreamClient.Model.MessageOptions do
  @moduledoc "Schema representing a MessageOptions"
  use ExStreamClient.Jason
  defstruct [:include_thread_participants]
  @nested_components %{}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{include_thread_participants: boolean() | nil}
end
