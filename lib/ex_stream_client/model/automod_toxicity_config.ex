defmodule ExStreamClient.Model.AutomodToxicityConfig do
  @moduledoc "Schema representing a AutomodToxicityConfig"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:async, :enabled, :rules]
  @nested_components rules: ExStreamClient.Model.AutomodRule
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          async: boolean() | nil,
          enabled: boolean() | nil,
          rules: [ExStreamClient.Model.AutomodRule.t()] | nil
        }
end
