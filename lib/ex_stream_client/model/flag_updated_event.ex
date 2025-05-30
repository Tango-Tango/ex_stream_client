defmodule ExStreamClient.Model.FlagUpdatedEvent do
  @moduledoc "Schema representing a FlagUpdatedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :custom, :type]
  defstruct [:created_at, :created_by, :custom, :message, :received_at, :type, :user]

  @nested_components CreatedBy: ExStreamClient.Model.UserResponse,
                     Message: ExStreamClient.Model.MessageResponse,
                     User: ExStreamClient.Model.UserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: float(),
          created_by: ExStreamClient.Model.UserResponse.t() | nil,
          custom: map(),
          message: ExStreamClient.Model.MessageResponse.t() | nil,
          received_at: float() | nil,
          type: String.t(),
          user: ExStreamClient.Model.UserResponse.t() | nil
        }
end
