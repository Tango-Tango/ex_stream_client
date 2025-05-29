defmodule ExStreamClient.Model.PrivacySettings do
  @moduledoc "Schema representing a PrivacySettings"
  use ExStreamClient.Jason
  defstruct [:read_receipts, :typing_indicators]

  @type t :: %__MODULE__{
          read_receipts: ExStreamClient.Model.ReadReceipts.t() | nil,
          typing_indicators: ExStreamClient.Model.TypingIndicators.t() | nil
        }
end