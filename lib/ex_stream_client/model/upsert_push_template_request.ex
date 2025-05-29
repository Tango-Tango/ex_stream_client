defmodule ExStreamClient.Model.UpsertPushTemplateRequest do
  @moduledoc "Schema representing a UpsertPushTemplateRequest"
  use ExStreamClient.Jason
  @enforce_keys [:event_type, :push_provider_type]
  defstruct [:template, :push_provider_name, :push_provider_type, :event_type, :enable_push]

  @type t :: %__MODULE__{
          template: String.t() | nil,
          push_provider_name: String.t() | nil,
          push_provider_type: :apn | :firebase,
          event_type: :"reaction.new" | :"message.updated" | :"message.new",
          enable_push: boolean() | nil
        }
end