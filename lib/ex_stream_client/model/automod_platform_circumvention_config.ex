defmodule ExStreamClient.Model.AutomodPlatformCircumventionConfig do
  @moduledoc "Schema representing a AutomodPlatformCircumventionConfig"
  use ExStreamClient.Jason
  @enforce_keys [:enabled, :rules]
  defstruct [:async, :enabled, :rules]
  @nested_components %{rules: ExStreamClient.Model.AutomodRule}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          async: boolean() | nil,
          enabled: boolean(),
          rules: [ExStreamClient.Model.AutomodRule.t()]
        }
end
