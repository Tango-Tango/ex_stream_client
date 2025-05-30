defmodule ExStreamClient.Model.UserMute do
  @moduledoc "Schema representing a UserMute"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :updated_at]
  defstruct [:created_at, :expires, :target, :updated_at, :user]
  @nested_components %{user: ExStreamClient.Model.User, target: ExStreamClient.Model.User}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: float(),
          expires: float() | nil,
          target: ExStreamClient.Model.User.t() | nil,
          updated_at: float(),
          user: ExStreamClient.Model.User.t() | nil
        }
end
