defmodule ExStreamClient.Model.MarkChannelsReadRequest do
  @moduledoc "Schema representing a MarkChannelsReadRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:read_by_channel, :user, :user_id]
  @nested_components user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          read_by_channel: map() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
