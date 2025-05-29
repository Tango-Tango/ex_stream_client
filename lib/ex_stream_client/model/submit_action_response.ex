defmodule ExStreamClient.Model.SubmitActionResponse do
  @moduledoc "Schema representing a SubmitActionResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:item, :duration]

  @type t :: %__MODULE__{
          item: ExStreamClient.Model.ReviewQueueItem.t() | nil,
          duration: String.t()
        }
end