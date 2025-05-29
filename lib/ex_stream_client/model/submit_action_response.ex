defmodule ExStreamClient.Model.SubmitActionResponse do
  @moduledoc "Schema representing a SubmitActionResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration, :item]

  @type t :: %__MODULE__{
          duration: String.t(),
          item: ExStreamClient.Model.ReviewQueueItem.t() | nil
        }
end