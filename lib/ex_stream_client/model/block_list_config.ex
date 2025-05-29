defmodule ExStreamClient.Model.BlockListConfig do
  @moduledoc "Schema representing a BlockListConfig"
  use ExStreamClient.Jason
  @enforce_keys [:enabled, :rules]
  defstruct [:async, :enabled, :rules]

  @type t :: %__MODULE__{
          async: boolean() | nil,
          enabled: boolean(),
          rules: [ExStreamClient.Model.BlockListRule.t()]
        }
end