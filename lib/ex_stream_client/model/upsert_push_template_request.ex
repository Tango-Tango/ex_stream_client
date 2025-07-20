defmodule ExStreamClient.Model.UpsertPushTemplateRequest do
  @moduledoc "Schema representing a UpsertPushTemplateRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:event_type, :push_provider_type]
  defstruct [:enable_push, :event_type, :push_provider_name, :push_provider_type, :template]
  @nested_components event_type: :enum, push_provider_type: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          enable_push: boolean() | nil,
          event_type:
            :"notification.reminder_due" | :"reaction.new" | :"message.updated" | :"message.new",
          push_provider_name: String.t() | nil,
          push_provider_type: :apn | :firebase,
          template: String.t() | nil
        }
end
