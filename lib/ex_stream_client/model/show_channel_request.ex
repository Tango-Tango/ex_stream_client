defmodule ExStreamClient.Model.ShowChannelRequest do
  @moduledoc "Schema representing a ShowChannelRequest"
  use ExStreamClient.Jason
  defstruct [:user, :user_id]
  @nested_components user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
