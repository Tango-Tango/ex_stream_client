defmodule ExStreamClient.Model.CustomCheckFlag do
  @moduledoc "Schema representing a CustomCheckFlag"
  use ExStreamClient.Jason
  @enforce_keys [:type]
  defstruct [:custom, :labels, :reason, :type]

  @type t :: %__MODULE__{
          custom: map() | nil,
          labels: [String.t()] | nil,
          reason: String.t() | nil,
          type: String.t()
        }
end