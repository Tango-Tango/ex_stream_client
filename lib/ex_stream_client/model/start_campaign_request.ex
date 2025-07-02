defmodule ExStreamClient.Model.StartCampaignRequest do
  @moduledoc "Schema representing a StartCampaignRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:scheduled_for, :stop_at]
  @nested_components scheduled_for: :datetime, stop_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          scheduled_for: (DateTime.t() | integer() | String.t()) | nil,
          stop_at: (DateTime.t() | integer() | String.t()) | nil
        }
end
