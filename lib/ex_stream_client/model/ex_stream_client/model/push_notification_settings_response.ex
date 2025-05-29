defmodule ExStreamClient.Model.PushNotificationSettingsResponse do
  @moduledoc "Schema representing a PushNotificationSettingsResponse"
  use ExStreamClient.Jason
  defstruct [:disabled, :disabled_until]
  @type t :: %__MODULE__{disabled: boolean() | nil, disabled_until: float() | nil}
end