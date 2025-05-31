defmodule ExStreamClient.Model.CampaignChannelTemplate do
  @moduledoc "Schema representing a CampaignChannelTemplate"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:custom, :type]
  defstruct [:custom, :id, :members, :team, :type]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          custom: map(),
          id: String.t() | nil,
          members: [String.t()] | nil,
          team: String.t() | nil,
          type: String.t()
        }
end
