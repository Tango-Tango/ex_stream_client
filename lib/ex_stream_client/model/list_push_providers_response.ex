defmodule ExStreamClient.Model.ListPushProvidersResponse do
  @moduledoc "Schema representing a ListPushProvidersResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :push_providers]
  defstruct [:duration, :push_providers]

  @type t :: %__MODULE__{
          duration: String.t(),
          push_providers: [ExStreamClient.Model.PushProviderResponse.t()]
        }
end