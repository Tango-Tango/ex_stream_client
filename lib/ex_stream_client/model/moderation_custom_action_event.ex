defmodule ExStreamClient.Model.ModerationCustomActionEvent do
  @moduledoc "Schema representing a ModerationCustomActionEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :type]
  defstruct [:created_at, :item, :message, :type, :user]

  @nested_components created_at: :datetime,
                     item: ExStreamClient.Model.ReviewQueueItem,
                     message: ExStreamClient.Model.Message,
                     user: ExStreamClient.Model.User
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: DateTime.t() | integer() | String.t(),
          item: ExStreamClient.Model.ReviewQueueItem.t() | nil,
          message: ExStreamClient.Model.Message.t() | nil,
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end
