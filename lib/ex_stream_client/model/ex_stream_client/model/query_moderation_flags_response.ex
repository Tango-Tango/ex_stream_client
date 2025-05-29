defmodule ExStreamClient.Model.QueryModerationFlagsResponse do
  @moduledoc "Schema representing a QueryModerationFlagsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :flags]
  defstruct [:flags, :next, :prev, :duration]

  @type t :: %__MODULE__{
          flags: [ExStreamClient.Model.ModerationFlagResponse.t()],
          next: String.t() | nil,
          prev: String.t() | nil,
          duration: String.t()
        }
end