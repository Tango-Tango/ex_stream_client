defmodule ExStreamClient.Model.TextRuleParameters do
  @moduledoc "Schema representing a TextRuleParameters"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  defstruct [
    :blocklist_match,
    :contains_url,
    :harm_labels,
    :llm_harm_labels,
    :semantic_filter_min_threshold,
    :semantic_filter_names,
    :severity,
    :threshold,
    :time_window
  ]

  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          blocklist_match: [String.t()] | nil,
          contains_url: boolean() | nil,
          harm_labels: [String.t()] | nil,
          llm_harm_labels: %{optional(String.t()) => String.t()} | nil,
          semantic_filter_min_threshold: float() | nil,
          semantic_filter_names: [String.t()] | nil,
          severity: String.t() | nil,
          threshold: integer() | nil,
          time_window: String.t() | nil
        }
end
