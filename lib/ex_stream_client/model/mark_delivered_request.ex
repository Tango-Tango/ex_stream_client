defmodule ExStreamClient.Model.MarkDeliveredRequest do
  @moduledoc "Schema representing a MarkDeliveredRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:latest_delivered_messages]
  @nested_components latest_delivered_messages: ExStreamClient.Model.DeliveredMessagePayload
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          latest_delivered_messages: [ExStreamClient.Model.DeliveredMessagePayload.t()] | nil
        }
end
