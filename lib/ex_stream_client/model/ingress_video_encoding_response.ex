defmodule ExStreamClient.Model.IngressVideoEncodingResponse do
  @moduledoc "Schema representing a IngressVideoEncodingResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:layers]
  defstruct [:layers]
  @nested_components layers: ExStreamClient.Model.IngressVideoLayerResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{layers: [ExStreamClient.Model.IngressVideoLayerResponse.t()]}
end
