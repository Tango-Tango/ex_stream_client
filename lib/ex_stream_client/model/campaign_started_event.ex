defmodule ExStreamClient.Model.CampaignStartedEvent do
  @moduledoc "Schema representing a CampaignStartedEvent"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :custom, :type]
  defstruct [:campaign, :created_at, :custom, :received_at, :type]
  @nested_components %{campaign: ExStreamClient.Model.CampaignResponse}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          campaign: ExStreamClient.Model.CampaignResponse.t() | nil,
          created_at: float(),
          custom: map(),
          received_at: float() | nil,
          type: String.t()
        }
end
