defmodule ExStreamClient.Model.UpdateUsersPartialRequest do
  @moduledoc "Schema representing a UpdateUsersPartialRequest"
  use ExStreamClient.Jason
  @enforce_keys [:users]
  defstruct [:users]
  @type t :: %__MODULE__{users: [ExStreamClient.Model.UpdateUserPartialRequest.t()]}
end