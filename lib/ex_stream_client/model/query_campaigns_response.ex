defmodule ExStreamClient.Model.QueryCampaignsResponse do
  @moduledoc "Schema representing a QueryCampaignsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:campaigns, :duration]
  defstruct [:campaigns, :duration, :next, :prev]
  @nested_components campaigns: ExStreamClient.Model.CampaignResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          campaigns: [ExStreamClient.Model.CampaignResponse.t()],
          duration: String.t(),
          next: String.t() | nil,
          prev: String.t() | nil
        }
end
