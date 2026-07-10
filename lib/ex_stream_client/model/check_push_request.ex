defmodule ExStreamClient.Model.CheckPushRequest do
  @moduledoc "Schema representing a CheckPushRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  defstruct [
    :apn_template,
    :event_type,
    :firebase_data_template,
    :firebase_template,
    :message_id,
    :push_provider_name,
    :push_provider_type,
    :skip_devices,
    :user,
    :user_id
  ]

  @nested_components event_type: :enum, user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          apn_template: String.t() | nil,
          event_type:
            (:"notification.reminder_due"
             | :"reaction.updated"
             | :"reaction.new"
             | :"message.updated"
             | :"message.new")
            | nil,
          firebase_data_template: String.t() | nil,
          firebase_template: String.t() | nil,
          message_id: String.t() | nil,
          push_provider_name: String.t() | nil,
          push_provider_type: String.t() | nil,
          skip_devices: boolean() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
