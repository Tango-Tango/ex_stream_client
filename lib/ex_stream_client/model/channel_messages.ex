defmodule ExStreamClient.Model.ChannelMessages do
  @moduledoc "Schema representing a ChannelMessages"
  use ExStreamClient.Jason
  @enforce_keys [:messages]
  defstruct [:messages, :channel]

  @type t :: %__MODULE__{
          messages: [ExStreamClient.Model.Message.t()],
          channel: ExStreamClient.Model.ChannelResponse.t() | nil
        }
end