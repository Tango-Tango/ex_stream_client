defmodule ExStreamClient.Model.GetApplicationResponse do
  @moduledoc "Schema representing a GetApplicationResponse"
  use ExStreamClient.Jason
  @enforce_keys [:app, :duration]
  defstruct [:app, :duration]
  @type t :: %__MODULE__{app: ExStreamClient.Model.AppResponseFields.t(), duration: String.t()}
end