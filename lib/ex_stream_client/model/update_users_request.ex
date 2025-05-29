defmodule ExStreamClient.Model.UpdateUsersRequest do
  @moduledoc "Schema representing a UpdateUsersRequest"
  use ExStreamClient.Jason
  @enforce_keys [:users]
  defstruct [:users]
  @type t :: %__MODULE__{users: map()}
end