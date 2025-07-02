defmodule ExStreamClient.Model.UserUnmutedEvent do
  @moduledoc "Schema representing a UserUnmutedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :type]
  defstruct [:created_at, :target_user, :target_users, :type, :user]
  @nested_components created_at: :datetime, user: ExStreamClient.Model.User
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: DateTime.t() | integer() | String.t(),
          target_user: String.t() | nil,
          target_users: [String.t()] | nil,
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end
