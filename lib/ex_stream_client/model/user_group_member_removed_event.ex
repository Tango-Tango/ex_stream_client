defmodule ExStreamClient.Model.UserGroupMemberRemovedEvent do
  @moduledoc "Schema representing a UserGroupMemberRemovedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :custom, :members, :type]
  defstruct [:created_at, :custom, :members, :received_at, :type, :user, :user_group]

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
          members: [String.t()],
          received_at: (DateTime.t() | integer() | String.t()) | nil,
          type: String.t(),
          user: ExStreamClient.Model.UserResponseCommonFields.t() | nil,
          user_group: ExStreamClient.Model.UserGroup.t() | nil
        }
end
