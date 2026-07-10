defmodule ExStreamClient.Model.FeedsNotificationTrigger do
  @moduledoc "Schema representing a FeedsNotificationTrigger"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:text, :type]
  defstruct [:comment, :custom, :text, :type]
  @nested_components comment: ExStreamClient.Model.FeedsNotificationComment
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          comment: ExStreamClient.Model.FeedsNotificationComment.t() | nil,
          custom: %{optional(String.t()) => any()} | nil,
          text: String.t(),
          type: String.t()
        }
end
