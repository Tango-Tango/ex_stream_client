defmodule ExStreamClient.Model.SubmitModerationFeedbackRequest do
  @moduledoc "Schema representing a SubmitModerationFeedbackRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:message, :published_at, :reference]
  defstruct [
    :channel_id,
    :current_labels,
    :current_recommended_action,
    :description,
    :expected_labels,
    :expected_recommended_action,
    :message,
    :published_at,
    :reference
  ]

  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel_id: String.t() | nil,
          current_labels: [String.t()] | nil,
          current_recommended_action: String.t() | nil,
          description: String.t() | nil,
          expected_labels: [String.t()] | nil,
          expected_recommended_action: String.t() | nil,
          message: String.t(),
          published_at: String.t(),
          reference: String.t()
        }
end
