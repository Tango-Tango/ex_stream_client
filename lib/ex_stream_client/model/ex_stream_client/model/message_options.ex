defmodule ExStreamClient.Model.MessageOptions do
  @moduledoc "Schema representing a MessageOptions"
  use ExStreamClient.Jason
  defstruct [:include_thread_participants]
  @type t :: %__MODULE__{include_thread_participants: boolean() | nil}
end