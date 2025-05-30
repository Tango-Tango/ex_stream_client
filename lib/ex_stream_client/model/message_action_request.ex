defmodule ExStreamClient.Model.MessageActionRequest do
  @moduledoc "Schema representing a MessageActionRequest"
  use ExStreamClient.Jason
  @enforce_keys [:form_data]
  defstruct [:form_data, :user, :user_id]
  @nested_components %{user: ExStreamClient.Model.UserRequest}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          form_data: map(),
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
