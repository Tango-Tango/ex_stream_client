defmodule ExStreamClient.Model.UserReactivatedEvent do
  @moduledoc "Schema representing a UserReactivatedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :type]
  defstruct [:created_at, :type, :user]
  @nested_components created_at: :datetime, user: ExStreamClient.Model.User
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: DateTime.t() | integer() | String.t(),
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end
