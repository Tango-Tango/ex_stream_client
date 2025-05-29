defmodule ExStreamClient.Model.GetImportResponse do
  @moduledoc "Schema representing a GetImportResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration, :import_task]

  @type t :: %__MODULE__{
          duration: String.t(),
          import_task: ExStreamClient.Model.ImportTask.t() | nil
        }
end