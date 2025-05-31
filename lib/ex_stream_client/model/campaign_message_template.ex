defmodule ExStreamClient.Model.CampaignMessageTemplate do
  @moduledoc "Schema representing a CampaignMessageTemplate"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:attachments, :custom, :poll_id, :text]
  defstruct [:attachments, :custom, :poll_id, :text]
  @nested_components attachments: ExStreamClient.Model.Attachment
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          attachments: [ExStreamClient.Model.Attachment.t()],
          custom: %{optional(String.t()) => any()},
          poll_id: String.t(),
          text: String.t()
        }
end
