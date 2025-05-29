defmodule ExStreamClient.Model.ListBlockListResponse do
  @moduledoc "Schema representing a ListBlockListResponse"
  use ExStreamClient.Jason
  @enforce_keys [:blocklists, :duration]
  defstruct [:blocklists, :duration]

  @type t :: %__MODULE__{
          blocklists: [ExStreamClient.Model.BlockListResponse.t()],
          duration: String.t()
        }
end