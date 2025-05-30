defmodule ExStreamClient.Model.ModerationDashboardPreferences do
  @moduledoc "Schema representing a ModerationDashboardPreferences"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:media_queue_blur_enabled]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{media_queue_blur_enabled: boolean() | nil}
end
