defmodule ExStreamClient.Model.EgressRTMPResponse do
  @moduledoc "Schema representing a EgressRTMPResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:name, :started_at]
  defstruct [:name, :started_at, :stream_key, :stream_url]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          name: String.t(),
          started_at: float(),
          stream_key: String.t() | nil,
          stream_url: String.t() | nil
        }
end
