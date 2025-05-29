defmodule ExStreamClient.Model.ModerationDashboardPreferences do
  @moduledoc "Schema representing a ModerationDashboardPreferences"
  use ExStreamClient.Jason
  defstruct [:media_queue_blur_enabled]
  @type t :: %__MODULE__{media_queue_blur_enabled: boolean() | nil}
end