defmodule ExStreamClient.Model.CallIngressResponse do
  @moduledoc "Schema representing a CallIngressResponse"
  use ExStreamClient.Jason
  @enforce_keys [:rtmp]
  defstruct [:rtmp]
  @type t :: %__MODULE__{rtmp: ExStreamClient.Model.RTMPIngress.t()}
end