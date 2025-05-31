defmodule ExStreamClient.Model.UpsertPushPreferencesRequest do
  @moduledoc "Schema representing a UpsertPushPreferencesRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:preferences]
  defstruct [:preferences]
  @nested_components preferences: ExStreamClient.Model.PushPreferenceInput
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{preferences: [ExStreamClient.Model.PushPreferenceInput.t()]}
end
