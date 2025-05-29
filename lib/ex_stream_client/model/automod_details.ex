defmodule ExStreamClient.Model.AutomodDetails do
  @moduledoc "Schema representing a AutomodDetails"
  use ExStreamClient.Jason
  defstruct [:result, :action, :image_labels, :message_details, :original_message_type]

  @type t :: %__MODULE__{
          result: ExStreamClient.Model.MessageModerationResult.t() | nil,
          action: String.t() | nil,
          image_labels: [String.t()] | nil,
          message_details: ExStreamClient.Model.FlagMessageDetails.t() | nil,
          original_message_type: String.t() | nil
        }
end