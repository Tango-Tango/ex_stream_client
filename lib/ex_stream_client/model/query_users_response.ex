defmodule ExStreamClient.Model.QueryUsersResponse do
  @moduledoc "Schema representing a QueryUsersResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :users]
  defstruct [:duration, :users]
  @nested_components users: ExStreamClient.Model.FullUserResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{duration: String.t(), users: [ExStreamClient.Model.FullUserResponse.t()]}
end
