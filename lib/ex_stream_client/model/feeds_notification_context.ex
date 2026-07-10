defmodule ExStreamClient.Model.FeedsNotificationContext do
  @moduledoc "Schema representing a FeedsNotificationContext"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:target, :trigger]

  @nested_components target: ExStreamClient.Model.FeedsNotificationTarget,
                     trigger: ExStreamClient.Model.FeedsNotificationTrigger
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          target: ExStreamClient.Model.FeedsNotificationTarget.t() | nil,
          trigger: ExStreamClient.Model.FeedsNotificationTrigger.t() | nil
        }
end
