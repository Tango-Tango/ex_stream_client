defmodule ExStreamClient.Model.FeedsReactionResponse do
  @moduledoc "Schema representing a FeedsReactionResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:activity_id, :created_at, :type, :updated_at, :user]
  defstruct [:activity_id, :comment_id, :created_at, :custom, :type, :updated_at, :user]

  @nested_components created_at: :datetime,
                     updated_at: :datetime,
                     user: ExStreamClient.Model.UserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          activity_id: String.t(),
          comment_id: String.t() | nil,
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()} | nil,
          type: String.t(),
          updated_at: DateTime.t() | integer() | String.t(),
          user: ExStreamClient.Model.UserResponse.t()
        }
end
