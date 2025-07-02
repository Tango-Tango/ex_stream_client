defmodule ExStreamClient.Model.CallMember do
  @moduledoc "Schema representing a CallMember"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :custom, :role, :updated_at, :user_id]
  defstruct [:created_at, :custom, :deleted_at, :role, :updated_at, :user, :user_id]

  @nested_components created_at: :datetime,
                     deleted_at: :datetime,
                     updated_at: :datetime,
                     user: ExStreamClient.Model.User
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          deleted_at: (DateTime.t() | integer() | String.t()) | nil,
          role: String.t(),
          updated_at: DateTime.t() | integer() | String.t(),
          user: ExStreamClient.Model.User.t() | nil,
          user_id: String.t()
        }
end
