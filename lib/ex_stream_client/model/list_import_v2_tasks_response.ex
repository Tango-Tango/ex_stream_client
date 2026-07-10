defmodule ExStreamClient.Model.ListImportV2TasksResponse do
  @moduledoc "Schema representing a ListImportV2TasksResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :import_tasks]
  defstruct [:duration, :import_tasks, :next, :prev]
  @nested_components import_tasks: ExStreamClient.Model.ImportV2TaskItem
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          import_tasks: [ExStreamClient.Model.ImportV2TaskItem.t()],
          next: String.t() | nil,
          prev: String.t() | nil
        }
end
