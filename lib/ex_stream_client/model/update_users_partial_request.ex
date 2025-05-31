defmodule ExStreamClient.Model.UpdateUsersPartialRequest do
  @moduledoc "Schema representing a UpdateUsersPartialRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:users]
  defstruct [:users]
  @nested_components users: ExStreamClient.Model.UpdateUserPartialRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{users: [ExStreamClient.Model.UpdateUserPartialRequest.t()]}
end
