defmodule ExStreamClient.Model.ReactionRequest do
  @moduledoc "Schema representing a ReactionRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:type]
  defstruct [:created_at, :custom, :score, :type, :updated_at, :user, :user_id]

  @nested_components created_at: :datetime,
                     updated_at: :datetime,
                     user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: (DateTime.t() | integer() | String.t()) | nil,
          custom: %{optional(String.t()) => any()} | nil,
          score: integer() | nil,
          type: String.t(),
          updated_at: (DateTime.t() | integer() | String.t()) | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
