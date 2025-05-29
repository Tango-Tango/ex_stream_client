defmodule ExStreamClient.Model.DeleteChannelsRequest do
  @moduledoc "Schema representing a DeleteChannelsRequest"
  use ExStreamClient.Jason
  @enforce_keys [:cids]
  defstruct [:cids, :hard_delete]
  @type t :: %__MODULE__{cids: [String.t()], hard_delete: boolean() | nil}
end