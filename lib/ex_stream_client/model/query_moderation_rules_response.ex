defmodule ExStreamClient.Model.QueryModerationRulesResponse do
  @moduledoc "Schema representing a QueryModerationRulesResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  @enforce_keys [
    :ai_image_label_definitions,
    :ai_image_subclassifications,
    :closed_caption_labels,
    :default_llm_labels,
    :duration,
    :keyframe_label_classifications,
    :keyframe_labels,
    :rules
  ]
  defstruct [
    :ai_image_label_definitions,
    :ai_image_subclassifications,
    :closed_caption_labels,
    :default_llm_labels,
    :duration,
    :keyframe_label_classifications,
    :keyframe_labels,
    :next,
    :prev,
    :rules
  ]

  @nested_components ai_image_label_definitions: ExStreamClient.Model.AIImageLabelDefinition,
                     rules: ExStreamClient.Model.ModerationRuleV2Response
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          ai_image_label_definitions: [ExStreamClient.Model.AIImageLabelDefinition.t()],
          ai_image_subclassifications: %{optional(String.t()) => [String.t()]},
          closed_caption_labels: [String.t()],
          default_llm_labels: %{optional(String.t()) => String.t()},
          duration: String.t(),
          keyframe_label_classifications: %{optional(String.t()) => [String.t()]},
          keyframe_labels: [String.t()],
          next: String.t() | nil,
          prev: String.t() | nil,
          rules: [ExStreamClient.Model.ModerationRuleV2Response.t()]
        }
end
