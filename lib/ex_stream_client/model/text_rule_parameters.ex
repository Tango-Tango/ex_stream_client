defmodule ExStreamClient.Model.TextRuleParameters do
  @moduledoc "Schema representing a TextRuleParameters"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:threshold, :time_window]
  defstruct [:blocklist_match, :contains_url, :harm_labels, :severity, :threshold, :time_window]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          blocklist_match: [String.t()] | nil,
          contains_url: boolean() | nil,
          harm_labels: [String.t()] | nil,
          severity: String.t() | nil,
          threshold: integer(),
          time_window: String.t()
        }
end
