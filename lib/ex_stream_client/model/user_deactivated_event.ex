defmodule ExStreamClient.Model.UserDeactivatedEvent do
  @moduledoc "Schema representing a UserDeactivatedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :created_by, :type]
  defstruct [:created_at, :created_by, :type, :user]
  @nested_components %{user: ExStreamClient.Model.User, created_by: ExStreamClient.Model.User}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: float(),
          created_by: ExStreamClient.Model.User.t(),
          type: String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end
