defmodule ExStreamClient.Model.BulkUpsertActionConfigRequest do
  @moduledoc "Schema representing a BulkUpsertActionConfigRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:action_configs]
  defstruct [:action_configs, :user, :user_id]

  @nested_components action_configs: ExStreamClient.Model.UpsertActionConfigItem,
                     user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          action_configs: [ExStreamClient.Model.UpsertActionConfigItem.t()],
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
