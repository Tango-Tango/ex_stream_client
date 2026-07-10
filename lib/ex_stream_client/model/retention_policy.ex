defmodule ExStreamClient.Model.RetentionPolicy do
  @moduledoc "Schema representing a RetentionPolicy"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:app_pk, :config, :enabled_at, :policy]
  defstruct [:app_pk, :config, :enabled_at, :policy]
  @nested_components config: ExStreamClient.Model.PolicyConfig, enabled_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          app_pk: integer(),
          config: ExStreamClient.Model.PolicyConfig.t(),
          enabled_at: DateTime.t() | integer() | String.t(),
          policy: String.t()
        }
end
