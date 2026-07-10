defmodule ExStreamClient.Model.PushTemplateResponse do
  @moduledoc "Schema representing a PushTemplateResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :enable_push, :event_type, :push_provider_internal_id, :updated_at]
  defstruct [
    :created_at,
    :enable_push,
    :event_type,
    :push_provider_internal_id,
    :template,
    :updated_at
  ]

  @nested_components created_at: :datetime, updated_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: DateTime.t() | integer() | String.t(),
          enable_push: boolean(),
          event_type: String.t(),
          push_provider_internal_id: String.t(),
          template: String.t() | nil,
          updated_at: DateTime.t() | integer() | String.t()
        }
end
