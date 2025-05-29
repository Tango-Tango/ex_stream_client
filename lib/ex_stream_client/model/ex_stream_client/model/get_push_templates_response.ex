defmodule ExStreamClient.Model.GetPushTemplatesResponse do
  @moduledoc "Schema representing a GetPushTemplatesResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :templates]
  defstruct [:duration, :templates]
  @type t :: %__MODULE__{duration: String.t(), templates: [ExStreamClient.Model.PushTemplate.t()]}
end