defmodule ExStreamClient.Model.GroupedQueryChannelsRequest do
  @moduledoc "Schema representing a GroupedQueryChannelsRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:limit, :user, :user_id]
  @nested_components user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          limit: integer() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
