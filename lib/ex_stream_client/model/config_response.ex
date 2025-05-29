defmodule ExStreamClient.Model.ConfigResponse do
  @moduledoc "Schema representing a ConfigResponse"
  use ExStreamClient.Jason
  @enforce_keys [:async, :created_at, :key, :team, :updated_at]
  defstruct [
    :async,
    :key,
    :team,
    :created_at,
    :updated_at,
    :ai_image_config,
    :ai_text_config,
    :ai_video_config,
    :automod_platform_circumvention_config,
    :automod_semantic_filters_config,
    :automod_toxicity_config,
    :block_list_config,
    :velocity_filter_config
  ]

  @type t :: %__MODULE__{
          async: boolean(),
          key: String.t(),
          team: String.t(),
          created_at: float(),
          updated_at: float(),
          ai_image_config: ExStreamClient.Model.AIImageConfig.t() | nil,
          ai_text_config: ExStreamClient.Model.AITextConfig.t() | nil,
          ai_video_config: ExStreamClient.Model.AIVideoConfig.t() | nil,
          automod_platform_circumvention_config:
            ExStreamClient.Model.AutomodPlatformCircumventionConfig.t() | nil,
          automod_semantic_filters_config:
            ExStreamClient.Model.AutomodSemanticFiltersConfig.t() | nil,
          automod_toxicity_config: ExStreamClient.Model.AutomodToxicityConfig.t() | nil,
          block_list_config: ExStreamClient.Model.BlockListConfig.t() | nil,
          velocity_filter_config: ExStreamClient.Model.VelocityFilterConfig.t() | nil
        }
end