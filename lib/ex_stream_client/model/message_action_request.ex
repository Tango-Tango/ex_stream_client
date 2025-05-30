defmodule ExStreamClient.Model.MessageActionRequest do
  @moduledoc "Schema representing a MessageActionRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:form_data]
  defstruct [:form_data, :user, :user_id]
  @nested_components user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          form_data: %{optional(String.t()) => String.t()},
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
