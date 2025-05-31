defmodule ExStreamClient.Model.PushNotificationSettingsResponse do
  @moduledoc "Schema representing a PushNotificationSettingsResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:disabled, :disabled_until]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{disabled: boolean() | nil, disabled_until: float() | nil}
end
