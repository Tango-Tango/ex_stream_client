defmodule ExStreamClient.Model.ConfigResponse do
  @moduledoc "Schema representing a ConfigResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:async, :created_at, :key, :team, :updated_at]
  defstruct [
    :ai_image_config,
    :ai_text_config,
    :ai_video_config,
    :async,
    :automod_platform_circumvention_config,
    :automod_semantic_filters_config,
    :automod_toxicity_config,
    :block_list_config,
    :created_at,
    :key,
    :rule_builder_config,
    :team,
    :updated_at,
    :velocity_filter_config,
    :video_call_rule_config
  ]

  @nested_components ai_image_config: ExStreamClient.Model.AIImageConfig,
                     ai_text_config: ExStreamClient.Model.AITextConfig,
                     ai_video_config: ExStreamClient.Model.AIVideoConfig,
                     automod_platform_circumvention_config:
                       ExStreamClient.Model.AutomodPlatformCircumventionConfig,
                     automod_semantic_filters_config:
                       ExStreamClient.Model.AutomodSemanticFiltersConfig,
                     automod_toxicity_config: ExStreamClient.Model.AutomodToxicityConfig,
                     block_list_config: ExStreamClient.Model.BlockListConfig,
                     created_at: :datetime,
                     rule_builder_config: ExStreamClient.Model.RuleBuilderConfig,
                     updated_at: :datetime,
                     velocity_filter_config: ExStreamClient.Model.VelocityFilterConfig,
                     video_call_rule_config: ExStreamClient.Model.VideoCallRuleConfig
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          ai_image_config: ExStreamClient.Model.AIImageConfig.t() | nil,
          ai_text_config: ExStreamClient.Model.AITextConfig.t() | nil,
          ai_video_config: ExStreamClient.Model.AIVideoConfig.t() | nil,
          async: boolean(),
          automod_platform_circumvention_config:
            ExStreamClient.Model.AutomodPlatformCircumventionConfig.t() | nil,
          automod_semantic_filters_config:
            ExStreamClient.Model.AutomodSemanticFiltersConfig.t() | nil,
          automod_toxicity_config: ExStreamClient.Model.AutomodToxicityConfig.t() | nil,
          block_list_config: ExStreamClient.Model.BlockListConfig.t() | nil,
          created_at: DateTime.t() | integer() | String.t(),
          key: String.t(),
          rule_builder_config: ExStreamClient.Model.RuleBuilderConfig.t() | nil,
          team: String.t(),
          updated_at: DateTime.t() | integer() | String.t(),
          velocity_filter_config: ExStreamClient.Model.VelocityFilterConfig.t() | nil,
          video_call_rule_config: ExStreamClient.Model.VideoCallRuleConfig.t() | nil
        }
end
