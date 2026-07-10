defmodule ExStreamClient.Model.FutureChannelBanResponse do
  @moduledoc "Schema representing a FutureChannelBanResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at]
  defstruct [:banned_by, :created_at, :expires, :reason, :shadow, :user]

  @nested_components banned_by: ExStreamClient.Model.UserResponse,
                     created_at: :datetime,
                     expires: :datetime,
                     user: ExStreamClient.Model.UserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          banned_by: ExStreamClient.Model.UserResponse.t() | nil,
          created_at: DateTime.t() | integer() | String.t(),
          expires: (DateTime.t() | integer() | String.t()) | nil,
          reason: String.t() | nil,
          shadow: boolean() | nil,
          user: ExStreamClient.Model.UserResponse.t() | nil
        }
end
