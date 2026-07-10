defmodule ExStreamClient.Model.FlagFeedbackResponse do
  @moduledoc "Schema representing a FlagFeedbackResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :labels, :message_id]
  defstruct [:created_at, :labels, :message_id]
  @nested_components created_at: :datetime, labels: ExStreamClient.Model.LabelResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: DateTime.t() | integer() | String.t(),
          labels: [ExStreamClient.Model.LabelResponse.t()],
          message_id: String.t()
        }
end
