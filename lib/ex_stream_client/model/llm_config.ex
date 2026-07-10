defmodule ExStreamClient.Model.LLMConfig do
  @moduledoc "Schema representing a LLMConfig"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:app_context, :async, :enabled, :rules, :severity_descriptions]
  @nested_components rules: ExStreamClient.Model.LLMRule
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          app_context: String.t() | nil,
          async: boolean() | nil,
          enabled: boolean() | nil,
          rules: [ExStreamClient.Model.LLMRule.t()] | nil,
          severity_descriptions: %{optional(String.t()) => String.t()} | nil
        }
end
