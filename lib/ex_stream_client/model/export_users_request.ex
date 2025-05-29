defmodule ExStreamClient.Model.ExportUsersRequest do
  @moduledoc "Schema representing a ExportUsersRequest"
  use ExStreamClient.Jason
  @enforce_keys [:user_ids]
  defstruct [:user_ids]
  @type t :: %__MODULE__{user_ids: [String.t()]}
end