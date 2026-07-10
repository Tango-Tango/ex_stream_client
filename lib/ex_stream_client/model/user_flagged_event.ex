defmodule ExStreamClient.Model.UserFlaggedEvent do
  @moduledoc "Schema representing a UserFlaggedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :reason, :total_flags, :type, :user]
  defstruct [
    :created_at,
    :custom,
    :reason,
    :received_at,
    :target_user,
    :total_flags,
    :type,
    :user
  ]

  @nested_components created_at: :datetime,
                     received_at: :datetime,
                     target_user: ExStreamClient.Model.UserResponseCommonFields,
                     user: ExStreamClient.Model.UserResponseCommonFields
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()} | nil,
          reason: String.t(),
          received_at: (DateTime.t() | integer() | String.t()) | nil,
          target_user: ExStreamClient.Model.UserResponseCommonFields.t() | nil,
          total_flags: integer(),
          type: String.t(),
          user: ExStreamClient.Model.UserResponseCommonFields.t()
        }
end
