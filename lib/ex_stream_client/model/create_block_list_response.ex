defmodule ExStreamClient.Model.CreateBlockListResponse do
  @moduledoc "Schema representing a CreateBlockListResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration, :blocklist]

  @type t :: %__MODULE__{
          duration: String.t(),
          blocklist: ExStreamClient.Model.BlockListResponse.t() | nil
        }
end