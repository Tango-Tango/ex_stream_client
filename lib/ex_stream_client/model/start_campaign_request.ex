defmodule ExStreamClient.Model.StartCampaignRequest do
  @moduledoc "Schema representing a StartCampaignRequest"
  use ExStreamClient.Jason
  defstruct [:scheduled_for, :stop_at]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{scheduled_for: float() | nil, stop_at: float() | nil}
end
