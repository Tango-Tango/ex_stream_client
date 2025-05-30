defmodule ExStreamClient.Model.PrivacySettingsResponse do
  @moduledoc "Schema representing a PrivacySettingsResponse"
  use ExStreamClient.Jason
  defstruct [:read_receipts, :typing_indicators]

  @nested_components read_receipts: ExStreamClient.Model.ReadReceiptsResponse,
                     typing_indicators: ExStreamClient.Model.TypingIndicatorsResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          read_receipts: ExStreamClient.Model.ReadReceiptsResponse.t() | nil,
          typing_indicators: ExStreamClient.Model.TypingIndicatorsResponse.t() | nil
        }
end
