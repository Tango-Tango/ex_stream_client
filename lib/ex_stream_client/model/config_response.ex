defmodule ExStreamClient.Model.ConfigResponse do
  @moduledoc "Schema representing a ConfigResponse"
  use ExStreamClient.Jason
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
    :team,
    :updated_at,
    :velocity_filter_config
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
                     velocity_filter_config: ExStreamClient.Model.VelocityFilterConfig
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
          created_at: float(),
          key: String.t(),
          team: String.t(),
          updated_at: float(),
          velocity_filter_config: ExStreamClient.Model.VelocityFilterConfig.t() | nil
        }
end
