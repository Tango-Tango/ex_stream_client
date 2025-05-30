defmodule ExStreamClient.Model.UpsertPushPreferencesRequest do
  @moduledoc "Schema representing a UpsertPushPreferencesRequest"
  use ExStreamClient.Jason
  @enforce_keys [:preferences]
  defstruct [:preferences]
  @nested_components preferences: ExStreamClient.Model.PushPreferenceInput
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{preferences: [ExStreamClient.Model.PushPreferenceInput.t()]}
end
