defmodule ExStreamClient.Model.UpdateBlockListResponse do
  @moduledoc "Schema representing a UpdateBlockListResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:blocklist, :duration]

  @type t :: %__MODULE__{
          blocklist: ExStreamClient.Model.BlockListResponse.t() | nil,
          duration: String.t()
        }
end