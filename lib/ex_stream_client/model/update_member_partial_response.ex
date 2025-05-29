defmodule ExStreamClient.Model.UpdateMemberPartialResponse do
  @moduledoc "Schema representing a UpdateMemberPartialResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration, :channel_member]

  @type t :: %__MODULE__{
          duration: String.t(),
          channel_member: ExStreamClient.Model.ChannelMemberResponse.t() | nil
        }
end