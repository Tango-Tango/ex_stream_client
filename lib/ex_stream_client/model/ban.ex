defmodule ExStreamClient.Model.Ban do
  @moduledoc "Schema representing a Ban"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :shadow]
  defstruct [:channel, :created_at, :created_by, :expires, :reason, :shadow, :target]

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.Channel.t() | nil,
          created_at: float(),
          created_by: ExStreamClient.Model.User.t() | nil,
          expires: float() | nil,
          reason: String.t() | nil,
          shadow: boolean(),
          target: ExStreamClient.Model.User.t() | nil
        }
end