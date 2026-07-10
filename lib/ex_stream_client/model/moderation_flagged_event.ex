defmodule ExStreamClient.Model.ModerationFlaggedEvent do
  @moduledoc "Schema representing a ModerationFlaggedEvent"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:content_type, :created_at, :custom, :object_id, :type]
  defstruct [:content_type, :created_at, :custom, :object_id, :received_at, :type]
  @nested_components created_at: :datetime, received_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          content_type: String.t(),
          created_at: DateTime.t() | integer() | String.t(),
          custom: %{optional(String.t()) => any()},
          object_id: String.t(),
          received_at: (DateTime.t() | integer() | String.t()) | nil,
          type: String.t()
        }
end
