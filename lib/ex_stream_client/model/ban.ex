defmodule ExStreamClient.Model.Ban do
  @moduledoc "Schema representing a Ban"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :shadow]
  defstruct [:reason, :target, :shadow, :channel, :created_at, :created_by, :expires]

  @type t :: %__MODULE__{
          reason: String.t() | nil,
          target: ExStreamClient.Model.User.t() | nil,
          shadow: boolean(),
          channel: ExStreamClient.Model.Channel.t() | nil,
          created_at: float(),
          created_by: ExStreamClient.Model.User.t() | nil,
          expires: float() | nil
        }
end