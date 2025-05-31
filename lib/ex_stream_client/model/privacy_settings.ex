defmodule ExStreamClient.Model.PrivacySettings do
  @moduledoc "Schema representing a PrivacySettings"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:read_receipts, :typing_indicators]

  @nested_components read_receipts: ExStreamClient.Model.ReadReceipts,
                     typing_indicators: ExStreamClient.Model.TypingIndicators
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          read_receipts: ExStreamClient.Model.ReadReceipts.t() | nil,
          typing_indicators: ExStreamClient.Model.TypingIndicators.t() | nil
        }
end
