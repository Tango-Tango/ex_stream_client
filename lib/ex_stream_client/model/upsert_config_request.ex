defmodule ExStreamClient.Model.UpsertConfigRequest do
  @moduledoc "Schema representing a UpsertConfigRequest"
  use ExStreamClient.Jason
  @enforce_keys [:key]
  defstruct [
    :ai_image_config,
    :ai_text_config,
    :ai_video_config,
    :async,
    :automod_platform_circumvention_config,
    :automod_semantic_filters_config,
    :automod_toxicity_config,
    :aws_rekognition_config,
    :block_list_config,
    :bodyguard_config,
    :google_vision_config,
    :key,
    :rule_builder_config,
    :team,
    :user,
    :user_id,
    :velocity_filter_config
  ]

  @nested_components %{
    user: ExStreamClient.Model.UserRequest,
    ai_image_config: ExStreamClient.Model.AIImageConfig,
    ai_text_config: ExStreamClient.Model.AITextConfig,
    ai_video_config: ExStreamClient.Model.AIVideoConfig,
    automod_platform_circumvention_config:
      ExStreamClient.Model.AutomodPlatformCircumventionConfig,
    automod_semantic_filters_config: ExStreamClient.Model.AutomodSemanticFiltersConfig,
    automod_toxicity_config: ExStreamClient.Model.AutomodToxicityConfig,
    block_list_config: ExStreamClient.Model.BlockListConfig,
    velocity_filter_config: ExStreamClient.Model.VelocityFilterConfig,
    aws_rekognition_config: ExStreamClient.Model.AIImageConfig,
    bodyguard_config: ExStreamClient.Model.AITextConfig,
    google_vision_config: ExStreamClient.Model.GoogleVisionConfig,
    rule_builder_config: ExStreamClient.Model.RuleBuilderConfig
  }
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          ai_image_config: ExStreamClient.Model.AIImageConfig.t() | nil,
          ai_text_config: ExStreamClient.Model.AITextConfig.t() | nil,
          ai_video_config: ExStreamClient.Model.AIVideoConfig.t() | nil,
          async: boolean() | nil,
          automod_platform_circumvention_config:
            ExStreamClient.Model.AutomodPlatformCircumventionConfig.t() | nil,
          automod_semantic_filters_config:
            ExStreamClient.Model.AutomodSemanticFiltersConfig.t() | nil,
          automod_toxicity_config: ExStreamClient.Model.AutomodToxicityConfig.t() | nil,
          aws_rekognition_config: ExStreamClient.Model.AIImageConfig.t() | nil,
          block_list_config: ExStreamClient.Model.BlockListConfig.t() | nil,
          bodyguard_config: ExStreamClient.Model.AITextConfig.t() | nil,
          google_vision_config: ExStreamClient.Model.GoogleVisionConfig.t() | nil,
          key: String.t(),
          rule_builder_config: ExStreamClient.Model.RuleBuilderConfig.t() | nil,
          team: String.t() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil,
          velocity_filter_config: ExStreamClient.Model.VelocityFilterConfig.t() | nil
        }
end
