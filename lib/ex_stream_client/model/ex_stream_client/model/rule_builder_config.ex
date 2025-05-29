defmodule ExStreamClient.Model.RuleBuilderConfig do
  @moduledoc "Schema representing a RuleBuilderConfig"
  use ExStreamClient.Jason
  defstruct [:async, :enabled, :rules]

  @type t :: %__MODULE__{
          async: boolean() | nil,
          enabled: boolean() | nil,
          rules: [ExStreamClient.Model.RuleBuilderRule.t()] | nil
        }
end