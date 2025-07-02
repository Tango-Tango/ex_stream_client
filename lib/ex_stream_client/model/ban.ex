defmodule ExStreamClient.Model.Ban do
  @moduledoc "Schema representing a Ban"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :shadow]
  defstruct [:channel, :created_at, :created_by, :expires, :reason, :shadow, :target]

  @nested_components channel: ExStreamClient.Model.Channel,
                     created_at: :datetime,
                     created_by: ExStreamClient.Model.User,
                     expires: :datetime,
                     target: ExStreamClient.Model.User
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          channel: ExStreamClient.Model.Channel.t() | nil,
          created_at: DateTime.t() | integer() | String.t(),
          created_by: ExStreamClient.Model.User.t() | nil,
          expires: (DateTime.t() | integer() | String.t()) | nil,
          reason: String.t() | nil,
          shadow: boolean(),
          target: ExStreamClient.Model.User.t() | nil
        }
end
