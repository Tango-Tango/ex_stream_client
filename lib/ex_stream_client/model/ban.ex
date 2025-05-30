defmodule ExStreamClient.Model.Ban do
  @moduledoc "Schema representing a Ban"
  use ExStreamClient.Jason
  @enforce_keys [:created_at, :shadow]
  defstruct [:channel, :created_at, :created_by, :expires, :reason, :shadow, :target]

  @nested_components %{
    target: ExStreamClient.Model.User,
    channel: ExStreamClient.Model.Channel,
    created_by: ExStreamClient.Model.User
  }
  def nested_components do
    @nested_components
  end

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
