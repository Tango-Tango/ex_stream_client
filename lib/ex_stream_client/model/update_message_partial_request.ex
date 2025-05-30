defmodule ExStreamClient.Model.UpdateMessagePartialRequest do
  @moduledoc "Schema representing a UpdateMessagePartialRequest"
  use ExStreamClient.Jason
  defstruct [:set, :skip_enrich_url, :unset, :user, :user_id]
  @nested_components %{user: ExStreamClient.Model.UserRequest}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          set: map() | nil,
          skip_enrich_url: boolean() | nil,
          unset: [String.t()] | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
