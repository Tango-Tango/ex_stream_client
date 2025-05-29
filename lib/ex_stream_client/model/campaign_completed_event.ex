defmodule ExStreamClient.Model.CampaignCompletedEvent do
  @moduledoc "Schema representing a CampaignCompletedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :custom, :type]
  defstruct [:campaign, :created_at, :custom, :received_at, :type]

  @type t :: %__MODULE__{
          campaign: ExStreamClient.Model.CampaignResponse.t() | nil,
          created_at: float(),
          custom: map(),
          received_at: float() | nil,
          type: String.t()
        }
end