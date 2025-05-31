defmodule ExStreamClient.Model.EventRequest do
  @moduledoc "Schema representing a EventRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:type]
  defstruct [:custom, :parent_id, :type, :user, :user_id]
  @nested_components user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          custom: map() | nil,
          parent_id: String.t() | nil,
          type: String.t(),
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
