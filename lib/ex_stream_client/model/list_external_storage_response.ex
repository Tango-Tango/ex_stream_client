defmodule ExStreamClient.Model.ListExternalStorageResponse do
  @moduledoc "Schema representing a ListExternalStorageResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :external_storages]
  defstruct [:duration, :external_storages]
  @nested_components %{}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{duration: String.t(), external_storages: map()}
end
