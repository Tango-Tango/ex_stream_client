defmodule ExStreamClient.Model.ChannelExport do
  @moduledoc "Schema representing a ChannelExport"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:cid, :id, :messages_since, :messages_until, :type]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          cid: String.t() | nil,
          id: String.t() | nil,
          messages_since: float() | nil,
          messages_until: float() | nil,
          type: String.t() | nil
        }
end
