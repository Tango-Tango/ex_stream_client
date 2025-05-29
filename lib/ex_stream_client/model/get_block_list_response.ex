defmodule ExStreamClient.Model.GetBlockListResponse do
  @moduledoc "Schema representing a GetBlockListResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:blocklist, :duration]

  @type t :: %__MODULE__{
          blocklist: ExStreamClient.Model.BlockListResponse.t() | nil,
          duration: String.t()
        }
end