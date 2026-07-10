defmodule ExStreamClient.Model.CampaignMessageTemplate do
  @moduledoc "Schema representing a CampaignMessageTemplate"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:text]
  defstruct [:attachments, :custom, :poll_id, :searchable, :text]
  @nested_components attachments: ExStreamClient.Model.Attachment
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          attachments: [ExStreamClient.Model.Attachment.t()] | nil,
          custom: %{optional(String.t()) => any()} | nil,
          poll_id: String.t() | nil,
          searchable: boolean() | nil,
          text: String.t()
        }
end
