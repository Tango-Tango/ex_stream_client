defmodule ExStreamClient.Model.SegmentTargetResponse do
  @moduledoc "Schema representing a SegmentTargetResponse"
  use ExStreamClient.Jason
  @enforce_keys [:app_pk, :created_at, :segment_id, :target_id]
  defstruct [:created_at, :app_pk, :segment_id, :target_id]

  @type t :: %__MODULE__{
          created_at: float(),
          app_pk: integer(),
          segment_id: String.t(),
          target_id: String.t()
        }
end