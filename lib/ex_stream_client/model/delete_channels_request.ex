defmodule ExStreamClient.Model.DeleteChannelsRequest do
  @moduledoc "Schema representing a DeleteChannelsRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:cids]
  defstruct [:cids, :hard_delete]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{cids: [String.t()], hard_delete: boolean() | nil}
end
