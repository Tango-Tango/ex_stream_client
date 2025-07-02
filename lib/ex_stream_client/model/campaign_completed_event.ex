defmodule ExStreamClient.Model.CampaignCompletedEvent do
  @moduledoc "Schema representing a CampaignCompletedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :custom, :type]
  defstruct [:campaign, :created_at, :custom, :received_at, :type]

  @nested_components campaign: ExStreamClient.Model.CampaignResponse,
                     created_at: :datetime,
                     received_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          campaign: ExStreamClient.Model.CampaignResponse.t() | nil,
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          received_at: (DateTime.t() | integer() | String.t()) | nil,
          type: String.t()
        }
end
