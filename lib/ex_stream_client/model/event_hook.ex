defmodule ExStreamClient.Model.EventHook do
  @moduledoc "Schema representing a EventHook"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  defstruct [
    :created_at,
    :enabled,
    :event_types,
    :hook_type,
    :id,
    :sns_auth_type,
    :sns_key,
    :sns_region,
    :sns_role_arn,
    :sns_secret,
    :sns_topic_arn,
    :sqs_auth_type,
    :sqs_key,
    :sqs_queue_url,
    :sqs_region,
    :sqs_role_arn,
    :sqs_secret,
    :updated_at,
    :webhook_url
  ]

  @nested_components created_at: :datetime, updated_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: (DateTime.t() | integer() | String.t()) | nil,
          enabled: boolean() | nil,
          event_types: [String.t()] | nil,
          hook_type: String.t() | nil,
          id: String.t() | nil,
          sns_auth_type: String.t() | nil,
          sns_key: String.t() | nil,
          sns_region: String.t() | nil,
          sns_role_arn: String.t() | nil,
          sns_secret: String.t() | nil,
          sns_topic_arn: String.t() | nil,
          sqs_auth_type: String.t() | nil,
          sqs_key: String.t() | nil,
          sqs_queue_url: String.t() | nil,
          sqs_region: String.t() | nil,
          sqs_role_arn: String.t() | nil,
          sqs_secret: String.t() | nil,
          updated_at: (DateTime.t() | integer() | String.t()) | nil,
          webhook_url: String.t() | nil
        }
end
