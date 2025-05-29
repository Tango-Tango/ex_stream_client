defmodule ExStreamClient.Model.ListBlockListResponse do
  @moduledoc "Schema representing a ListBlockListResponse"
  use ExStreamClient.Jason
  @enforce_keys [:blocklists, :duration]
  defstruct [:duration, :blocklists]

  @type t :: %__MODULE__{
          duration: String.t(),
          blocklists: [ExStreamClient.Model.BlockListResponse.t()]
        }
end