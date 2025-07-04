defmodule ExStreamClient.Model.SegmentTargetResponse do
  @moduledoc "Schema representing a SegmentTargetResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:app_pk, :created_at, :segment_id, :target_id]
  defstruct [:app_pk, :created_at, :segment_id, :target_id]
  @nested_components created_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          app_pk: integer(),
          created_at: DateTime.t() | integer() | String.t(),
          segment_id: String.t(),
          target_id: String.t()
        }
end
