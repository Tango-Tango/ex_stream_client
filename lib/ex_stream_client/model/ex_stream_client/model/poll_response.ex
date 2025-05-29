defmodule ExStreamClient.Model.PollResponse do
  @moduledoc "Schema representing a PollResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :poll]
  defstruct [:duration, :poll]
  @type t :: %__MODULE__{duration: String.t(), poll: ExStreamClient.Model.PollResponseData.t()}
end