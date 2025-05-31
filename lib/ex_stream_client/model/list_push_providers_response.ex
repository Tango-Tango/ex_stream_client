defmodule ExStreamClient.Model.ListPushProvidersResponse do
  @moduledoc "Schema representing a ListPushProvidersResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :push_providers]
  defstruct [:duration, :push_providers]
  @nested_components push_providers: ExStreamClient.Model.PushProviderResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          push_providers: [ExStreamClient.Model.PushProviderResponse.t()]
        }
end
