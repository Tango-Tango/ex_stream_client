defmodule ExStreamClient.Model.RuleBuilderCondition do
  @moduledoc "Schema representing a RuleBuilderCondition"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:type]
  defstruct [
    :confidence,
    :content_count_rule_params,
    :image_content_params,
    :image_rule_params,
    :text_content_params,
    :text_rule_params,
    :type,
    :user_created_within_params,
    :user_rule_params,
    :video_content_params,
    :video_rule_params
  ]

  @nested_components content_count_rule_params: ExStreamClient.Model.ContentCountRuleParameters,
                     image_content_params: ExStreamClient.Model.ImageContentParameters,
                     image_rule_params: ExStreamClient.Model.ImageRuleParameters,
                     text_content_params: ExStreamClient.Model.TextContentParameters,
                     text_rule_params: ExStreamClient.Model.TextRuleParameters,
                     user_created_within_params: ExStreamClient.Model.UserCreatedWithinParameters,
                     user_rule_params: ExStreamClient.Model.UserRuleParameters,
                     video_content_params: ExStreamClient.Model.VideoContentParameters,
                     video_rule_params: ExStreamClient.Model.VideoRuleParameters
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          confidence: float() | nil,
          content_count_rule_params: ExStreamClient.Model.ContentCountRuleParameters.t() | nil,
          image_content_params: ExStreamClient.Model.ImageContentParameters.t() | nil,
          image_rule_params: ExStreamClient.Model.ImageRuleParameters.t() | nil,
          text_content_params: ExStreamClient.Model.TextContentParameters.t() | nil,
          text_rule_params: ExStreamClient.Model.TextRuleParameters.t() | nil,
          type: String.t(),
          user_created_within_params: ExStreamClient.Model.UserCreatedWithinParameters.t() | nil,
          user_rule_params: ExStreamClient.Model.UserRuleParameters.t() | nil,
          video_content_params: ExStreamClient.Model.VideoContentParameters.t() | nil,
          video_rule_params: ExStreamClient.Model.VideoRuleParameters.t() | nil
        }
end
