defmodule ExStreamClient.Model.GetThreadResponse do
  @moduledoc "Schema representing a GetThreadResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :thread]
  defstruct [:thread, :duration]

  @type t :: %__MODULE__{
          thread: ExStreamClient.Model.ThreadStateResponse.t(),
          duration: String.t()
        }
end