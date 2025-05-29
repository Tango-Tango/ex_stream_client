defmodule ExStreamClient.Model.GetCampaignResponse do
  @moduledoc "Schema representing a GetCampaignResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration, :campaign, :users]

  @type t :: %__MODULE__{
          duration: String.t(),
          campaign: ExStreamClient.Model.CampaignResponse.t() | nil,
          users: ExStreamClient.Model.PagerResponse.t() | nil
        }
end