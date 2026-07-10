defmodule ExStreamClient.Model.BanInfoResponse do
  @moduledoc "Schema representing a BanInfoResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at]
  defstruct [:created_at, :created_by, :expires, :reason, :shadow, :user]

  @nested_components created_at: :datetime,
                     created_by: ExStreamClient.Model.UserResponse,
                     expires: :datetime,
                     user: ExStreamClient.Model.UserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: DateTime.t() | integer() | String.t(),
          created_by: ExStreamClient.Model.UserResponse.t() | nil,
          expires: (DateTime.t() | integer() | String.t()) | nil,
          reason: String.t() | nil,
          shadow: boolean() | nil,
          user: ExStreamClient.Model.UserResponse.t() | nil
        }
end
