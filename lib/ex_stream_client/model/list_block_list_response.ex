defmodule ExStreamClient.Model.ListBlockListResponse do
  @moduledoc "Schema representing a ListBlockListResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:blocklists, :duration]
  defstruct [:blocklists, :duration]
  @nested_components blocklists: ExStreamClient.Model.BlockListResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          blocklists: [ExStreamClient.Model.BlockListResponse.t()],
          duration: String.t()
        }
end
