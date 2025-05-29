defmodule ExStreamClient.Model.QueryModerationFlagsResponse do
  @moduledoc "Schema representing a QueryModerationFlagsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :flags]
  defstruct [:duration, :flags, :next, :prev]

  @type t :: %__MODULE__{
          duration: String.t(),
          flags: [ExStreamClient.Model.ModerationFlagResponse.t()],
          next: String.t() | nil,
          prev: String.t() | nil
        }
end