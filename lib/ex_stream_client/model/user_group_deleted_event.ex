defmodule ExStreamClient.Model.UserGroupDeletedEvent do
  @moduledoc "Schema representing a UserGroupDeletedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :custom, :type]
  defstruct [:created_at, :custom, :received_at, :type, :user, :user_group]

  @nested_components created_at: :datetime,
                     received_at: :datetime,
                     user: ExStreamClient.Model.UserResponseCommonFields,
                     user_group: ExStreamClient.Model.UserGroup
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          received_at: (DateTime.t() | integer() | String.t()) | nil,
          type: String.t(),
          user: ExStreamClient.Model.UserResponseCommonFields.t() | nil,
          user_group: ExStreamClient.Model.UserGroup.t() | nil
        }
end
