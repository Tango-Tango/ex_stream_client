defmodule ExStreamClient.Model.ModerationConfig do
  @moduledoc "Schema representing a ModerationConfig"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  defstruct [
    :ai_image_config,
    :ai_image_lite_config,
    :ai_text_config,
    :ai_video_config,
    :async,
    :automod_platform_circumvention_config,
    :automod_semantic_filters_config,
    :automod_toxicity_config,
    :block_list_config,
    :created_at,
    :google_vision_config,
    :key,
    :llm_config,
    :supported_video_call_harm_types,
    :team,
    :updated_at,
    :velocity_filter_config,
    :video_call_rule_config
  ]

  @nested_components ai_image_config: ExStreamClient.Model.AIImageConfig,
                     ai_image_lite_config: ExStreamClient.Model.BodyguardImageAnalysisConfig,
                     ai_text_config: ExStreamClient.Model.AITextConfig,
                     ai_video_config: ExStreamClient.Model.AIVideoConfig,
                     automod_platform_circumvention_config:
                       ExStreamClient.Model.AutomodPlatformCircumventionConfig,
                     automod_semantic_filters_config:
                       ExStreamClient.Model.AutomodSemanticFiltersConfig,
                     automod_toxicity_config: ExStreamClient.Model.AutomodToxicityConfig,
                     block_list_config: ExStreamClient.Model.BlockListConfig,
                     created_at: :datetime,
                     google_vision_config: ExStreamClient.Model.GoogleVisionConfig,
                     llm_config: ExStreamClient.Model.LLMConfig,
                     updated_at: :datetime,
                     velocity_filter_config: ExStreamClient.Model.VelocityFilterConfig,
                     video_call_rule_config: ExStreamClient.Model.VideoCallRuleConfig
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          ai_image_config: ExStreamClient.Model.AIImageConfig.t() | nil,
          ai_image_lite_config: ExStreamClient.Model.BodyguardImageAnalysisConfig.t() | nil,
          ai_text_config: ExStreamClient.Model.AITextConfig.t() | nil,
          ai_video_config: ExStreamClient.Model.AIVideoConfig.t() | nil,
          async: boolean() | nil,
          automod_platform_circumvention_config:
            ExStreamClient.Model.AutomodPlatformCircumventionConfig.t() | nil,
          automod_semantic_filters_config:
            ExStreamClient.Model.AutomodSemanticFiltersConfig.t() | nil,
          automod_toxicity_config: ExStreamClient.Model.AutomodToxicityConfig.t() | nil,
          block_list_config: ExStreamClient.Model.BlockListConfig.t() | nil,
          created_at: (DateTime.t() | integer() | String.t()) | nil,
          google_vision_config: ExStreamClient.Model.GoogleVisionConfig.t() | nil,
          key: String.t() | nil,
          llm_config: ExStreamClient.Model.LLMConfig.t() | nil,
          supported_video_call_harm_types: [String.t()] | nil,
          team: String.t() | nil,
          updated_at: (DateTime.t() | integer() | String.t()) | nil,
          velocity_filter_config: ExStreamClient.Model.VelocityFilterConfig.t() | nil,
          video_call_rule_config: ExStreamClient.Model.VideoCallRuleConfig.t() | nil
        }
end
