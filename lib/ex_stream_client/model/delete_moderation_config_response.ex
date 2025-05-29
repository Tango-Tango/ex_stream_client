defmodule ExStreamClient.Model.DeleteModerationConfigResponse do
  @moduledoc "Schema representing a DeleteModerationConfigResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration]
  @type t :: %__MODULE__{duration: String.t()}
end