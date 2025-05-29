defmodule ExStreamClient.Model.DeleteMessageResponse do
  @moduledoc "Schema representing a DeleteMessageResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :message]
  defstruct [:message, :duration]
  @type t :: %__MODULE__{message: ExStreamClient.Model.MessageResponse.t(), duration: String.t()}
end