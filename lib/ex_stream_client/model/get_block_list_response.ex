defmodule ExStreamClient.Model.GetBlockListResponse do
  @moduledoc "Schema representing a GetBlockListResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration]
  defstruct [:blocklist, :duration]
  @nested_components blocklist: ExStreamClient.Model.BlockListResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          blocklist: ExStreamClient.Model.BlockListResponse.t() | nil,
          duration: String.t()
        }
end
