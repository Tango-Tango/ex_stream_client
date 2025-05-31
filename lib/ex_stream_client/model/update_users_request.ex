defmodule ExStreamClient.Model.UpdateUsersRequest do
  @moduledoc "Schema representing a UpdateUsersRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:users]
  defstruct [:users]
  @nested_components users: {:map, ExStreamClient.Model.UserRequest}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{users: %{optional(String.t()) => ExStreamClient.Model.UserRequest.t()}}
end
