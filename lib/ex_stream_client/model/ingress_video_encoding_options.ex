defmodule ExStreamClient.Model.IngressVideoEncodingOptions do
  @moduledoc "Schema representing a IngressVideoEncodingOptions"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:layers]
  defstruct [:layers]
  @nested_components layers: ExStreamClient.Model.IngressVideoLayer
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{layers: [ExStreamClient.Model.IngressVideoLayer.t()]}
end
