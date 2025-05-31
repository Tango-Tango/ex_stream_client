defmodule ExStreamClient.Model.GetImportResponse do
  @moduledoc "Schema representing a GetImportResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration]
  defstruct [:duration, :import_task]
  @nested_components import_task: ExStreamClient.Model.ImportTask
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          import_task: ExStreamClient.Model.ImportTask.t() | nil
        }
end
