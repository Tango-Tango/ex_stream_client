defmodule ExStreamClient.Model.UserDeactivatedEvent do
  @moduledoc "Schema representing a UserDeactivatedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :created_by, :type]
  defstruct [:created_at, :created_by, :type, :user]

  @nested_components created_at: :datetime,
                     created_by: ExStreamClient.Model.User,
                     user: ExStreamClient.Model.User
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: DateTime.t() | integer() | String.t(),
          created_by: ExStreamClient.Model.User.t(),
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end
