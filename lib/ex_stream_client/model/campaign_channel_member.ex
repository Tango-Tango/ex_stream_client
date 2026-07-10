defmodule ExStreamClient.Model.CampaignChannelMember do
  @moduledoc "Schema representing a CampaignChannelMember"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:user_id]
  defstruct [:channel_role, :custom, :user_id]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel_role: String.t() | nil,
          custom: %{optional(String.t()) => any()} | nil,
          user_id: String.t()
        }
end
