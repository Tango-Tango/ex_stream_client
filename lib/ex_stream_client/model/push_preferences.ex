defmodule ExStreamClient.Model.PushPreferences do
  @moduledoc "Schema representing a PushPreferences"
  use ExStreamClient.Jason
  defstruct [:call_level, :chat_level, :disabled_until]

  @type t :: %__MODULE__{
          call_level: String.t() | nil,
          chat_level: String.t() | nil,
          disabled_until: float() | nil
        }
end