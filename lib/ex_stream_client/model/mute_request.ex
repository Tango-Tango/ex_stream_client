defmodule ExStreamClient.Model.MuteRequest do
  @moduledoc "Schema representing a MuteRequest"
  use ExStreamClient.Jason
  @enforce_keys [:target_ids]
  defstruct [:target_ids, :timeout, :user, :user_id]
  @nested_components %{user: ExStreamClient.Model.UserRequest}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          target_ids: [String.t()],
          timeout: integer() | nil,
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
