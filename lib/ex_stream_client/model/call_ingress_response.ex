defmodule ExStreamClient.Model.CallIngressResponse do
  @moduledoc "Schema representing a CallIngressResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:rtmp]
  defstruct [:rtmp]
  @nested_components rtmp: ExStreamClient.Model.RTMPIngress
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{rtmp: ExStreamClient.Model.RTMPIngress.t()}
end
