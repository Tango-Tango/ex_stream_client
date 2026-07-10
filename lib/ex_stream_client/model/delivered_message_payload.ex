defmodule ExStreamClient.Model.DeliveredMessagePayload do
  @moduledoc "Schema representing a DeliveredMessagePayload"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:cid, :id]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{cid: String.t() | nil, id: String.t() | nil}
end
