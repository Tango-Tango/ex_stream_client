defmodule ExStreamClient.Model.QueryUsersResponse do
  @moduledoc "Schema representing a QueryUsersResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :users]
  defstruct [:duration, :users]
  @type t :: %__MODULE__{duration: String.t(), users: [ExStreamClient.Model.FullUserResponse.t()]}
end