defmodule ExStreamClient.Model.IngressVideoEncodingOptions do
  @moduledoc "Schema representing a IngressVideoEncodingOptions"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:layers]
  defstruct [:layers, :source]

  @nested_components layers: ExStreamClient.Model.IngressVideoLayer,
                     source: ExStreamClient.Model.IngressSource
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          layers: [ExStreamClient.Model.IngressVideoLayer.t()],
          source: ExStreamClient.Model.IngressSource.t() | nil
        }
end
