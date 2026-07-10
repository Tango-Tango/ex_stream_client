defmodule ExStreamClient.Model.BulkDeleteActionConfigRequest do
  @moduledoc "Schema representing a BulkDeleteActionConfigRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:ids]
  defstruct [:ids, :user, :user_id]
  @nested_components user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          ids: [String.t()],
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
