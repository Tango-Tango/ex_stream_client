defmodule ExStreamClient.Model.CampaignChannelTemplate do
  @moduledoc "Schema representing a CampaignChannelTemplate"
  use ExStreamClient.Jason
  @enforce_keys [:custom, :type]
  defstruct [:id, :type, :custom, :team, :members]

  @type t :: %__MODULE__{
          id: String.t() | nil,
          type: String.t(),
          custom: map(),
          team: String.t() | nil,
          members: [String.t()] | nil
        }
end