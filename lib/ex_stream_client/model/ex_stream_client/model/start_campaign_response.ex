defmodule ExStreamClient.Model.StartCampaignResponse do
  @moduledoc "Schema representing a StartCampaignResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration, :campaign, :users]

  @type t :: %__MODULE__{
          duration: String.t(),
          campaign: ExStreamClient.Model.CampaignResponse.t() | nil,
          users: ExStreamClient.Model.PagerResponse.t() | nil
        }
end