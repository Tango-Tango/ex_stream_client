defmodule ExStreamClient.Model.PushTemplate do
  @moduledoc "Schema representing a PushTemplate"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :enable_push, :event_type, :updated_at]
  defstruct [:created_at, :enable_push, :event_type, :template, :updated_at]
  @nested_components event_type: :atom
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: float(),
          enable_push: boolean(),
          event_type: :"reaction.new" | :"message.updated" | :"message.new",
          template: String.t() | nil,
          updated_at: float()
        }
end
