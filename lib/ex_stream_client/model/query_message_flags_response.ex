defmodule ExStreamClient.Model.QueryMessageFlagsResponse do
  @moduledoc "Schema representing a QueryMessageFlagsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :flags]
  defstruct [:duration, :flags]

  @type t :: %__MODULE__{
          duration: String.t(),
          flags: [ExStreamClient.Model.MessageFlagResponse.t()]
        }
end