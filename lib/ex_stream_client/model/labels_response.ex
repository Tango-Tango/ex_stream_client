defmodule ExStreamClient.Model.LabelsResponse do
  @moduledoc "Schema representing a LabelsResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :recommended_action]
  defstruct [
    :content_id,
    :directed_at,
    :duration,
    :harm_type,
    :labels,
    :language,
    :masked_content,
    :recommended_action,
    :severity
  ]

  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          content_id: String.t() | nil,
          directed_at: String.t() | nil,
          duration: String.t(),
          harm_type: String.t() | nil,
          labels: [String.t()] | nil,
          language: String.t() | nil,
          masked_content: String.t() | nil,
          recommended_action: String.t(),
          severity: String.t() | nil
        }
end
