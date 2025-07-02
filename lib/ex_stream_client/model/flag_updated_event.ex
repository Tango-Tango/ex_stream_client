defmodule ExStreamClient.Model.FlagUpdatedEvent do
  @moduledoc "Schema representing a FlagUpdatedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :custom, :type]
  defstruct [:created_at, :created_by, :custom, :message, :received_at, :type, :user]

  @nested_components created_at: :datetime,
                     created_by: ExStreamClient.Model.UserResponse,
                     message: ExStreamClient.Model.MessageResponse,
                     received_at: :datetime,
                     user: ExStreamClient.Model.UserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: DateTime.t() | integer() | String.t(),
          created_by: ExStreamClient.Model.UserResponse.t() | nil,
          custom: %{optional(String.t()) => any()},
          message: ExStreamClient.Model.MessageResponse.t() | nil,
          received_at: (DateTime.t() | integer() | String.t()) | nil,
          type: String.t(),
          user: ExStreamClient.Model.UserResponse.t() | nil
        }
end
