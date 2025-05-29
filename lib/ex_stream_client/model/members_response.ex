defmodule ExStreamClient.Model.MembersResponse do
  @moduledoc "Schema representing a MembersResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :members]
  defstruct [:duration, :members]
  @type t :: %__MODULE__{duration: String.t(), members: [ExStreamClient.Model.ChannelMember.t()]}
end