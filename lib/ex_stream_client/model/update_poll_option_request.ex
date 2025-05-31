defmodule ExStreamClient.Model.UpdatePollOptionRequest do
  @moduledoc "Schema representing a UpdatePollOptionRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:id, :text]
  defstruct [:custom, :id, :text, :user, :user_id]
  @nested_components user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          custom: %{optional(String.t()) => any()} | nil,
          id: String.t(),
          text: String.t(),
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
