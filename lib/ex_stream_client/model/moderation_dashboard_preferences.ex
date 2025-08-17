defmodule ExStreamClient.Model.ModerationDashboardPreferences do
  @moduledoc "Schema representing a ModerationDashboardPreferences"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:flag_user_on_flagged_content, :media_queue_blur_enabled]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          flag_user_on_flagged_content: boolean() | nil,
          media_queue_blur_enabled: boolean() | nil
        }
end
