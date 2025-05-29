defmodule ExStreamClient.Model.CallEgress do
  @moduledoc "Schema representing a CallEgress"
  use ExStreamClient.Jason

  @enforce_keys [
    :app_pk,
    :call_id,
    :call_type,
    :egress_id,
    :egress_type,
    :instance_ip,
    :started_at,
    :state,
    :updated_at
  ]
  defstruct [
    :state,
    :config,
    :started_at,
    :call_type,
    :updated_at,
    :app_pk,
    :call_id,
    :egress_id,
    :egress_type,
    :instance_ip,
    :stopped_at
  ]

  @type t :: %__MODULE__{
          state: String.t(),
          config: ExStreamClient.Model.EgressTaskConfig.t() | nil,
          started_at: float(),
          call_type: String.t(),
          updated_at: float(),
          app_pk: integer(),
          call_id: String.t(),
          egress_id: String.t(),
          egress_type: String.t(),
          instance_ip: String.t(),
          stopped_at: float() | nil
        }
end