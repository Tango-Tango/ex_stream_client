defmodule ExStreamClient.Model.BlockListConfig do
  @moduledoc "Schema representing a BlockListConfig"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:async, :enabled, :match_substring, :rules]
  @nested_components rules: ExStreamClient.Model.BlockListRule
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          async: boolean() | nil,
          enabled: boolean() | nil,
          match_substring: boolean() | nil,
          rules: [ExStreamClient.Model.BlockListRule.t()] | nil
        }
end
