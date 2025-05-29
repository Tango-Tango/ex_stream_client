defmodule ExStreamClient.Model.DeleteChannelsRequest do
  @moduledoc "Schema representing a DeleteChannelsRequest"
  use ExStreamClient.Jason
  @enforce_keys [:cids]
  defstruct [:hard_delete, :cids]
  @type t :: %__MODULE__{hard_delete: boolean() | nil, cids: [String.t()]}
end