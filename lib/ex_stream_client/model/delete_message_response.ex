defmodule ExStreamClient.Model.DeleteMessageResponse do
  @moduledoc "Schema representing a DeleteMessageResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :message]
  defstruct [:duration, :message]
  @type t :: %__MODULE__{duration: String.t(), message: ExStreamClient.Model.MessageResponse.t()}
end