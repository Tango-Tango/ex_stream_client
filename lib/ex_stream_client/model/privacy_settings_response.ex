defmodule ExStreamClient.Model.PrivacySettingsResponse do
  @moduledoc "Schema representing a PrivacySettingsResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:delivery_receipts, :read_receipts, :typing_indicators]

  @nested_components delivery_receipts: ExStreamClient.Model.DeliveryReceiptsResponse,
                     read_receipts: ExStreamClient.Model.ReadReceiptsResponse,
                     typing_indicators: ExStreamClient.Model.TypingIndicatorsResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          delivery_receipts: ExStreamClient.Model.DeliveryReceiptsResponse.t() | nil,
          read_receipts: ExStreamClient.Model.ReadReceiptsResponse.t() | nil,
          typing_indicators: ExStreamClient.Model.TypingIndicatorsResponse.t() | nil
        }
end
