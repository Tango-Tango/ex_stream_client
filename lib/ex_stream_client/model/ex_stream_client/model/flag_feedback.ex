defmodule ExStreamClient.Model.FlagFeedback do
  @moduledoc "Schema representing a FlagFeedback"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :labels, :message_id]
  defstruct [:labels, :created_at, :message_id]

  @type t :: %__MODULE__{
          labels: [ExStreamClient.Model.Label.t()],
          created_at: float(),
          message_id: String.t()
        }
end