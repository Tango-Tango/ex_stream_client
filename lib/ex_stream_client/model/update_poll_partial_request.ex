defmodule ExStreamClient.Model.UpdatePollPartialRequest do
  @moduledoc "Schema representing a UpdatePollPartialRequest"
  use ExStreamClient.Jason
  defstruct [:set, :unset, :user, :user_id]
  @nested_components %{user: ExStreamClient.Model.UserRequest}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          set: map() | nil,
          unset: [String.t()] | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
