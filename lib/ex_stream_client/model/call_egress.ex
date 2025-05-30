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
    :app_pk,
    :call_id,
    :call_type,
    :config,
    :egress_id,
    :egress_type,
    :instance_ip,
    :started_at,
    :state,
    :stopped_at,
    :updated_at
  ]

  @nested_components config: ExStreamClient.Model.EgressTaskConfig
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          app_pk: integer(),
          call_id: String.t(),
          call_type: String.t(),
          config: ExStreamClient.Model.EgressTaskConfig.t() | nil,
          egress_id: String.t(),
          egress_type: String.t(),
          instance_ip: String.t(),
          started_at: float(),
          state: String.t(),
          stopped_at: float() | nil,
          updated_at: float()
        }
end
