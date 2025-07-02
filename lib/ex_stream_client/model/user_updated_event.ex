defmodule ExStreamClient.Model.UserUpdatedEvent do
  @moduledoc "Schema representing a UserUpdatedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :custom, :type, :user]
  defstruct [:created_at, :custom, :received_at, :type, :user]

  @nested_components created_at: :datetime,
                     received_at: :datetime,
                     user: ExStreamClient.Model.UserResponsePrivacyFields
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          received_at: (DateTime.t() | integer() | String.t()) | nil,
          type: String.t(),
          user: ExStreamClient.Model.UserResponsePrivacyFields.t()
        }
end
