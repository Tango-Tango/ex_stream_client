defmodule ExStreamClient.Model.CampaignMessageTemplate do
  @moduledoc "Schema representing a CampaignMessageTemplate"
  use ExStreamClient.Jason
  @enforce_keys [:attachments, :custom, :poll_id, :text]
  defstruct [:text, :custom, :attachments, :poll_id]

  @type t :: %__MODULE__{
          text: String.t(),
          custom: map(),
          attachments: [ExStreamClient.Model.Attachment.t()],
          poll_id: String.t()
        }
end