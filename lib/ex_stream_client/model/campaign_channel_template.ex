defmodule ExStreamClient.Model.CampaignChannelTemplate do
  @moduledoc "Schema representing a CampaignChannelTemplate"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:type]
  defstruct [:custom, :id, :members, :members_template, :team, :type]
  @nested_components members_template: ExStreamClient.Model.CampaignChannelMember
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          custom: %{optional(String.t()) => any()} | nil,
          id: String.t() | nil,
          members: [String.t()] | nil,
          members_template: [ExStreamClient.Model.CampaignChannelMember.t()] | nil,
          team: String.t() | nil,
          type: String.t()
        }
end
