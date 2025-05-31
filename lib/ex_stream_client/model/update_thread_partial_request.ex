defmodule ExStreamClient.Model.UpdateThreadPartialRequest do
  @moduledoc "Schema representing a UpdateThreadPartialRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:set, :unset, :user, :user_id]
  @nested_components user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          set: %{optional(String.t()) => any()} | nil,
          unset: [String.t()] | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
