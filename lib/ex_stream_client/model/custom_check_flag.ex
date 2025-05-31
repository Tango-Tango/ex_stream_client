defmodule ExStreamClient.Model.CustomCheckFlag do
  @moduledoc "Schema representing a CustomCheckFlag"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:type]
  defstruct [:custom, :labels, :reason, :type]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          custom: %{optional(String.t()) => any()} | nil,
          labels: [String.t()] | nil,
          reason: String.t() | nil,
          type: String.t()
        }
end
