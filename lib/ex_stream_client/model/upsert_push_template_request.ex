defmodule ExStreamClient.Model.UpsertPushTemplateRequest do
  @moduledoc "Schema representing a UpsertPushTemplateRequest"
  use ExStreamClient.Jason
  @enforce_keys [:event_type, :push_provider_type]
  defstruct [:enable_push, :event_type, :push_provider_name, :push_provider_type, :template]

  @type t :: %__MODULE__{
          enable_push: boolean() | nil,
          event_type: :"reaction.new" | :"message.updated" | :"message.new",
          push_provider_name: String.t() | nil,
          push_provider_type: :apn | :firebase,
          template: String.t() | nil
        }
end