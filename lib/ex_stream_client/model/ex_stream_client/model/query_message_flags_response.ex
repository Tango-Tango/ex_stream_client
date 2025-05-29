defmodule ExStreamClient.Model.QueryMessageFlagsResponse do
  @moduledoc "Schema representing a QueryMessageFlagsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :flags]
  defstruct [:flags, :duration]

  @type t :: %__MODULE__{
          flags: [ExStreamClient.Model.MessageFlagResponse.t()],
          duration: String.t()
        }
end