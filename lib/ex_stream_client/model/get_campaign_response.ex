defmodule ExStreamClient.Model.GetCampaignResponse do
  @moduledoc "Schema representing a GetCampaignResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:campaign, :duration, :users]

  @nested_components %{
    campaign: ExStreamClient.Model.CampaignResponse,
    users: ExStreamClient.Model.PagerResponse
  }
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          campaign: ExStreamClient.Model.CampaignResponse.t() | nil,
          duration: String.t(),
          users: ExStreamClient.Model.PagerResponse.t() | nil
        }
end
