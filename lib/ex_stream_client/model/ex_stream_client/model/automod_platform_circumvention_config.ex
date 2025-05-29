defmodule ExStreamClient.Model.AutomodPlatformCircumventionConfig do
  @moduledoc "Schema representing a AutomodPlatformCircumventionConfig"
  use ExStreamClient.Jason
  @enforce_keys [:enabled, :rules]
  defstruct [:async, :enabled, :rules]

  @type t :: %__MODULE__{
          async: boolean() | nil,
          enabled: boolean(),
          rules: [ExStreamClient.Model.AutomodRule.t()]
        }
end