defmodule ExStreamClient.Model.AutomodDetailsResponse do
  @moduledoc "Schema representing a AutomodDetailsResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:action, :image_labels, :message_details, :original_message_type, :result]

  @nested_components message_details: ExStreamClient.Model.FlagMessageDetailsResponse,
                     result: ExStreamClient.Model.MessageModerationResult
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action: String.t() | nil,
          image_labels: [String.t()] | nil,
          message_details: ExStreamClient.Model.FlagMessageDetailsResponse.t() | nil,
          original_message_type: String.t() | nil,
          result: ExStreamClient.Model.MessageModerationResult.t() | nil
        }
end
