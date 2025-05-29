defmodule ExStreamClient.Model.PollOptionResponse do
  @moduledoc "Schema representing a PollOptionResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :poll_option]
  defstruct [:duration, :poll_option]

  @type t :: %__MODULE__{
          duration: String.t(),
          poll_option: ExStreamClient.Model.PollOptionResponseData.t()
        }
end