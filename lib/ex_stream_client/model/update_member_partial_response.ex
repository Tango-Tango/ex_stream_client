defmodule ExStreamClient.Model.UpdateMemberPartialResponse do
  @moduledoc "Schema representing a UpdateMemberPartialResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:channel_member, :duration]

  @type t :: %__MODULE__{
          channel_member: ExStreamClient.Model.ChannelMemberResponse.t() | nil,
          duration: String.t()
        }
end