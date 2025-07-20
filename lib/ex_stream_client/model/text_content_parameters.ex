defmodule ExStreamClient.Model.TextContentParameters do
  @moduledoc "Schema representing a TextContentParameters"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:blocklist_match, :contains_url, :harm_labels, :severity]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          blocklist_match: [String.t()] | nil,
          contains_url: boolean() | nil,
          harm_labels: [String.t()] | nil,
          severity: String.t() | nil
        }
end
