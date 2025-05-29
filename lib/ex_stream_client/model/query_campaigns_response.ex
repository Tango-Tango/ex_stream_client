defmodule ExStreamClient.Model.QueryCampaignsResponse do
  @moduledoc "Schema representing a QueryCampaignsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:campaigns, :duration]
  defstruct [:next, :prev, :duration, :campaigns]

  @type t :: %__MODULE__{
          next: String.t() | nil,
          prev: String.t() | nil,
          duration: String.t(),
          campaigns: [ExStreamClient.Model.CampaignResponse.t()]
        }
end