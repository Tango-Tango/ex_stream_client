defmodule ExStreamClient.Model.FlagFeedback do
  @moduledoc "Schema representing a FlagFeedback"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :labels, :message_id]
  defstruct [:created_at, :labels, :message_id]
  @nested_components %{labels: ExStreamClient.Model.Label}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: float(),
          labels: [ExStreamClient.Model.Label.t()],
          message_id: String.t()
        }
end
