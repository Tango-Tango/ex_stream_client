defmodule ExStreamClient.Model.RuleBuilderCondition do
  @moduledoc "Schema representing a RuleBuilderCondition"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  defstruct [
    :call_custom_property_params,
    :call_type_rule_params,
    :call_violation_count_params,
    :channel_message_count_rule_params,
    :closed_caption_rule_params,
    :confidence,
    :content_count_rule_params,
    :content_flag_count_rule_params,
    :image_content_params,
    :image_rule_params,
    :keyframe_rule_params,
    :text_content_params,
    :text_rule_params,
    :type,
    :user_created_within_params,
    :user_custom_property_params,
    :user_flag_count_rule_params,
    :user_identical_content_count_params,
    :user_role_params,
    :user_rule_params,
    :video_content_params,
    :video_rule_params
  ]

  @nested_components call_custom_property_params:
                       ExStreamClient.Model.CallCustomPropertyParameters,
                     call_type_rule_params: ExStreamClient.Model.CallTypeRuleParameters,
                     call_violation_count_params:
                       ExStreamClient.Model.CallViolationCountParameters,
                     channel_message_count_rule_params:
                       ExStreamClient.Model.ChannelMessageCountRuleParameters,
                     closed_caption_rule_params: ExStreamClient.Model.ClosedCaptionRuleParameters,
                     content_count_rule_params: ExStreamClient.Model.ContentCountRuleParameters,
                     content_flag_count_rule_params: ExStreamClient.Model.FlagCountRuleParameters,
                     image_content_params: ExStreamClient.Model.ImageContentParameters,
                     image_rule_params: ExStreamClient.Model.ImageRuleParameters,
                     keyframe_rule_params: ExStreamClient.Model.KeyframeRuleParameters,
                     text_content_params: ExStreamClient.Model.TextContentParameters,
                     text_rule_params: ExStreamClient.Model.TextRuleParameters,
                     user_created_within_params: ExStreamClient.Model.UserCreatedWithinParameters,
                     user_custom_property_params:
                       ExStreamClient.Model.UserCustomPropertyParameters,
                     user_flag_count_rule_params: ExStreamClient.Model.FlagCountRuleParameters,
                     user_identical_content_count_params:
                       ExStreamClient.Model.UserIdenticalContentCountParameters,
                     user_role_params: ExStreamClient.Model.UserRoleParameters,
                     user_rule_params: ExStreamClient.Model.UserRuleParameters,
                     video_content_params: ExStreamClient.Model.VideoContentParameters,
                     video_rule_params: ExStreamClient.Model.VideoRuleParameters
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          call_custom_property_params:
            ExStreamClient.Model.CallCustomPropertyParameters.t() | nil,
          call_type_rule_params: ExStreamClient.Model.CallTypeRuleParameters.t() | nil,
          call_violation_count_params:
            ExStreamClient.Model.CallViolationCountParameters.t() | nil,
          channel_message_count_rule_params:
            ExStreamClient.Model.ChannelMessageCountRuleParameters.t() | nil,
          closed_caption_rule_params: ExStreamClient.Model.ClosedCaptionRuleParameters.t() | nil,
          confidence: float() | nil,
          content_count_rule_params: ExStreamClient.Model.ContentCountRuleParameters.t() | nil,
          content_flag_count_rule_params: ExStreamClient.Model.FlagCountRuleParameters.t() | nil,
          image_content_params: ExStreamClient.Model.ImageContentParameters.t() | nil,
          image_rule_params: ExStreamClient.Model.ImageRuleParameters.t() | nil,
          keyframe_rule_params: ExStreamClient.Model.KeyframeRuleParameters.t() | nil,
          text_content_params: ExStreamClient.Model.TextContentParameters.t() | nil,
          text_rule_params: ExStreamClient.Model.TextRuleParameters.t() | nil,
          type: String.t() | nil,
          user_created_within_params: ExStreamClient.Model.UserCreatedWithinParameters.t() | nil,
          user_custom_property_params:
            ExStreamClient.Model.UserCustomPropertyParameters.t() | nil,
          user_flag_count_rule_params: ExStreamClient.Model.FlagCountRuleParameters.t() | nil,
          user_identical_content_count_params:
            ExStreamClient.Model.UserIdenticalContentCountParameters.t() | nil,
          user_role_params: ExStreamClient.Model.UserRoleParameters.t() | nil,
          user_rule_params: ExStreamClient.Model.UserRuleParameters.t() | nil,
          video_content_params: ExStreamClient.Model.VideoContentParameters.t() | nil,
          video_rule_params: ExStreamClient.Model.VideoRuleParameters.t() | nil
        }
end
