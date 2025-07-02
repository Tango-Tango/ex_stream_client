defmodule ExStreamClient.Model.PushTemplate do
  @moduledoc "Schema representing a PushTemplate"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :enable_push, :event_type, :updated_at]
  defstruct [:created_at, :enable_push, :event_type, :template, :updated_at]
  @nested_components created_at: :datetime, event_type: :enum, updated_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: DateTime.t() | integer() | String.t(),
          enable_push: boolean(),
          event_type: :"reaction.new" | :"message.updated" | :"message.new",
          template: String.t() | nil,
          updated_at: DateTime.t() | integer() | String.t()
        }
end
