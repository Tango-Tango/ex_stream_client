defmodule ExStreamClient.Model.CustomCheckFlag do
  @moduledoc "Schema representing a CustomCheckFlag"
  use ExStreamClient.Jason
  @enforce_keys [:type]
  defstruct [:reason, :type, :labels, :custom]

  @type t :: %__MODULE__{
          reason: String.t() | nil,
          type: String.t(),
          labels: [String.t()] | nil,
          custom: map() | nil
        }
end