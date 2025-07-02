defmodule ExStreamClient.Model.UserMute do
  @moduledoc "Schema representing a UserMute"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :updated_at]
  defstruct [:created_at, :expires, :target, :updated_at, :user]

  @nested_components created_at: :datetime,
                     expires: :datetime,
                     target: ExStreamClient.Model.User,
                     updated_at: :datetime,
                     user: ExStreamClient.Model.User
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: DateTime.t() | integer() | String.t(),
          expires: (DateTime.t() | integer() | String.t()) | nil,
          target: ExStreamClient.Model.User.t() | nil,
          updated_at: DateTime.t() | integer() | String.t(),
          user: ExStreamClient.Model.User.t() | nil
        }
end
