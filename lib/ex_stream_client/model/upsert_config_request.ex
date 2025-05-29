defmodule ExStreamClient.Model.UpsertConfigRequest do
  @moduledoc "Schema representing a UpsertConfigRequest"
  use ExStreamClient.Jason
  @enforce_keys [:key]
  defstruct [
    :async,
    :user,
    :key,
    :team,
    :user_id,
    :ai_image_config,
    :ai_text_config,
    :ai_video_config,
    :automod_platform_circumvention_config,
    :automod_semantic_filters_config,
    :automod_toxicity_config,
    :aws_rekognition_config,
    :block_list_config,
    :bodyguard_config,
    :google_vision_config,
    :rule_builder_config,
    :velocity_filter_config
  ]

  @type t :: %__MODULE__{
          async: boolean() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          key: String.t(),
          team: String.t() | nil,
          user_id: String.t() | nil,
          ai_image_config: ExStreamClient.Model.AIImageConfig.t() | nil,
          ai_text_config: ExStreamClient.Model.AITextConfig.t() | nil,
          ai_video_config: ExStreamClient.Model.AIVideoConfig.t() | nil,
          automod_platform_circumvention_config:
            ExStreamClient.Model.AutomodPlatformCircumventionConfig.t() | nil,
          automod_semantic_filters_config:
            ExStreamClient.Model.AutomodSemanticFiltersConfig.t() | nil,
          automod_toxicity_config: ExStreamClient.Model.AutomodToxicityConfig.t() | nil,
          aws_rekognition_config: ExStreamClient.Model.AIImageConfig.t() | nil,
          block_list_config: ExStreamClient.Model.BlockListConfig.t() | nil,
          bodyguard_config: ExStreamClient.Model.AITextConfig.t() | nil,
          google_vision_config: ExStreamClient.Model.GoogleVisionConfig.t() | nil,
          rule_builder_config: ExStreamClient.Model.RuleBuilderConfig.t() | nil,
          velocity_filter_config: ExStreamClient.Model.VelocityFilterConfig.t() | nil
        }
end