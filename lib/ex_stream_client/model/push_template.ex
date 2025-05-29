defmodule ExStreamClient.Model.PushTemplate do
  @moduledoc "Schema representing a PushTemplate"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :enable_push, :event_type, :updated_at]
  defstruct [:template, :created_at, :updated_at, :event_type, :enable_push]

  @type t :: %__MODULE__{
          template: String.t() | nil,
          created_at: float(),
          updated_at: float(),
          event_type: :"reaction.new" | :"message.updated" | :"message.new",
          enable_push: boolean()
        }
end