defmodule ExStreamClient.Model.ModerationFlaggedEvent do
  @moduledoc "Schema representing a ModerationFlaggedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :type]
  defstruct [:created_at, :item, :object_id, :type, :user]
  @nested_components %{user: ExStreamClient.Model.User}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: float(),
          item: String.t() | nil,
          object_id: String.t() | nil,
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end
