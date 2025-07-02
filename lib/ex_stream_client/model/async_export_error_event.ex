defmodule ExStreamClient.Model.AsyncExportErrorEvent do
  @moduledoc "Schema representing a AsyncExportErrorEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :custom, :error, :finished_at, :started_at, :task_id, :type]
  defstruct [
    :created_at,
    :custom,
    :error,
    :finished_at,
    :received_at,
    :started_at,
    :task_id,
    :type
  ]

  @nested_components created_at: :datetime,
                     finished_at: :datetime,
                     received_at: :datetime,
                     started_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          error: String.t(),
          finished_at: DateTime.t() | integer() | String.t(),
          received_at: (DateTime.t() | integer() | String.t()) | nil,
          started_at: DateTime.t() | integer() | String.t(),
          task_id: String.t(),
          type: String.t()
        }
end
