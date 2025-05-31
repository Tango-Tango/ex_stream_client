defmodule ExStreamClient.Model.UserMuteResponse do
  @moduledoc "Schema representing a UserMuteResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :updated_at]
  defstruct [:created_at, :expires, :target, :updated_at, :user]

  @nested_components target: ExStreamClient.Model.UserResponse,
                     user: ExStreamClient.Model.UserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: float(),
          expires: float() | nil,
          target: ExStreamClient.Model.UserResponse.t() | nil,
          updated_at: float(),
          user: ExStreamClient.Model.UserResponse.t() | nil
        }
end
