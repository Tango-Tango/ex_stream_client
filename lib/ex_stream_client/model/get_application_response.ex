defmodule ExStreamClient.Model.GetApplicationResponse do
  @moduledoc "Schema representing a GetApplicationResponse"
  use ExStreamClient.Jason
  @enforce_keys [:app, :duration]
  defstruct [:app, :duration]
  @nested_components %{app: ExStreamClient.Model.AppResponseFields}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{app: ExStreamClient.Model.AppResponseFields.t(), duration: String.t()}
end
