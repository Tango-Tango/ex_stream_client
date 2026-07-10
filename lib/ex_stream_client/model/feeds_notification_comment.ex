defmodule ExStreamClient.Model.FeedsNotificationComment do
  @moduledoc "Schema representing a FeedsNotificationComment"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:comment, :id, :user_id]
  defstruct [:attachments, :comment, :id, :user_id]
  @nested_components attachments: ExStreamClient.Model.Attachment
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          attachments: [ExStreamClient.Model.Attachment.t()] | nil,
          comment: String.t(),
          id: String.t(),
          user_id: String.t()
        }
end
