defmodule ExStreamClient.Model.ChannelExport do
  @moduledoc "Schema representing a ChannelExport"
  use ExStreamClient.Jason
  defstruct [:id, :type, :cid, :messages_since, :messages_until]

  @type t :: %__MODULE__{
          id: String.t() | nil,
          type: String.t() | nil,
          cid: String.t() | nil,
          messages_since: float() | nil,
          messages_until: float() | nil
        }
end