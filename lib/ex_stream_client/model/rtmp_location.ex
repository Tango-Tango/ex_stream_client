defmodule ExStreamClient.Model.RTMPLocation do
  @moduledoc "Schema representing a RTMPLocation"
  use ExStreamClient.Jason
  @enforce_keys [:name, :stream_key, :stream_url]
  defstruct [:name, :stream_key, :stream_url]
  @nested_components %{}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{name: String.t(), stream_key: String.t(), stream_url: String.t()}
end
