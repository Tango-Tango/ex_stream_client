defmodule ExStreamClient.Model.ListImportsResponse do
  @moduledoc "Schema representing a ListImportsResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :import_tasks]
  defstruct [:duration, :import_tasks]

  @type t :: %__MODULE__{
          duration: String.t(),
          import_tasks: [ExStreamClient.Model.ImportTask.t()]
        }
end