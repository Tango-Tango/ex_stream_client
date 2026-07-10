defmodule ExStreamClient.Model.UserUnmutedEvent do
  @moduledoc "Schema representing a UserUnmutedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :custom, :type, :user]
  defstruct [:created_at, :custom, :received_at, :target_user, :target_users, :type, :user]

  @nested_components created_at: :datetime,
                     received_at: :datetime,
                     target_user: ExStreamClient.Model.UserResponseCommonFields,
                     target_users: ExStreamClient.Model.UserResponseCommonFields,
                     user: ExStreamClient.Model.UserResponseCommonFields
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          received_at: (DateTime.t() | integer() | String.t()) | nil,
          target_user: ExStreamClient.Model.UserResponseCommonFields.t() | nil,
          target_users: [ExStreamClient.Model.UserResponseCommonFields.t()] | nil,
          type: String.t(),
          user: ExStreamClient.Model.UserResponseCommonFields.t()
        }
end
