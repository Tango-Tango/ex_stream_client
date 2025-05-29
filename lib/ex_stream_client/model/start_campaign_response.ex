defmodule ExStreamClient.Model.StartCampaignResponse do
  @moduledoc "Schema representing a StartCampaignResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:campaign, :duration, :users]

  @type t :: %__MODULE__{
          campaign: ExStreamClient.Model.CampaignResponse.t() | nil,
          duration: String.t(),
          users: ExStreamClient.Model.PagerResponse.t() | nil
        }
end