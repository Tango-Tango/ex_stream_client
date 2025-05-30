defmodule ExStreamClient.Model.AzureRequest do
  @moduledoc "Schema representing a AzureRequest"
  use ExStreamClient.Jason
  @enforce_keys [:abs_account_name, :abs_client_id, :abs_client_secret, :abs_tenant_id]
  defstruct [:abs_account_name, :abs_client_id, :abs_client_secret, :abs_tenant_id]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          abs_account_name: String.t(),
          abs_client_id: String.t(),
          abs_client_secret: String.t(),
          abs_tenant_id: String.t()
        }
end
