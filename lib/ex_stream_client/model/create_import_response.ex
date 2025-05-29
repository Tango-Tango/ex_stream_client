defmodule ExStreamClient.Model.CreateImportResponse do
  @moduledoc "Schema representing a CreateImportResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration, :import_task]

  @type t :: %__MODULE__{
          duration: String.t(),
          import_task: ExStreamClient.Model.ImportTask.t() | nil
        }
end