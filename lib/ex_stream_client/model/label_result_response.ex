defmodule ExStreamClient.Model.LabelResultResponse do
  @moduledoc "Schema representing a LabelResultResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  @enforce_keys [
    :category,
    :content,
    :content_type,
    :created_at,
    :harm_type,
    :id,
    :labels,
    :language,
    :recommended_action,
    :severity
  ]
  defstruct [
    :category,
    :content,
    :content_id,
    :content_type,
    :created_at,
    :directed_at,
    :harm_type,
    :id,
    :labels,
    :language,
    :masked_content,
    :policy,
    :recommended_action,
    :severity,
    :user_id
  ]

  @nested_components created_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          category: String.t(),
          content: String.t(),
          content_id: String.t() | nil,
          content_type: String.t(),
          created_at: DateTime.t() | integer() | String.t(),
          directed_at: String.t() | nil,
          harm_type: String.t(),
          id: String.t(),
          labels: [String.t()],
          language: String.t(),
          masked_content: String.t() | nil,
          policy: String.t() | nil,
          recommended_action: String.t(),
          severity: String.t(),
          user_id: String.t() | nil
        }
end
