defmodule ExStreamClient.Model.FeedsNotificationParentActivity do
  @moduledoc "Schema representing a FeedsNotificationParentActivity"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:id]
  defstruct [:attachments, :id, :text, :type, :user_id]
  @nested_components attachments: ExStreamClient.Model.Attachment
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          attachments: [ExStreamClient.Model.Attachment.t()] | nil,
          id: String.t(),
          text: String.t() | nil,
          type: String.t() | nil,
          user_id: String.t() | nil
        }
end
