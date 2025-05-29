defmodule ExStreamClient.Model.CampaignStartedEvent do
  @moduledoc "Schema representing a CampaignStartedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :custom, :type]
  defstruct [:type, :custom, :created_at, :received_at, :campaign]

  @type t :: %__MODULE__{
          type: String.t(),
          custom: map(),
          created_at: float(),
          received_at: float() | nil,
          campaign: ExStreamClient.Model.CampaignResponse.t() | nil
        }
end