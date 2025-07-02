defmodule ExStreamClient.Model.AsyncBulkImageModerationEvent do
  @moduledoc "Schema representing a AsyncBulkImageModerationEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:created_at, :custom, :finished_at, :started_at, :task_id, :type, :url]
  defstruct [:created_at, :custom, :finished_at, :received_at, :started_at, :task_id, :type, :url]

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
          finished_at: DateTime.t() | integer() | String.t(),
          received_at: (DateTime.t() | integer() | String.t()) | nil,
          started_at: DateTime.t() | integer() | String.t(),
          task_id: String.t(),
          type: String.t(),
          url: String.t()
        }
end
