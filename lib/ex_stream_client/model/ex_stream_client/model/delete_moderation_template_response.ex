defmodule ExStreamClient.Model.DeleteModerationTemplateResponse do
  @moduledoc "Schema representing a DeleteModerationTemplateResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration]
  @type t :: %__MODULE__{duration: String.t()}
end