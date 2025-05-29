defmodule ExStreamClient.Model.HideChannelResponse do
  @moduledoc "Schema representing a HideChannelResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration]
  @type t :: %__MODULE__{duration: String.t()}
end