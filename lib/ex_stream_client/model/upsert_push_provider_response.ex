defmodule ExStreamClient.Model.UpsertPushProviderResponse do
  @moduledoc "Schema representing a UpsertPushProviderResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :push_provider]
  defstruct [:duration, :push_provider]

  @type t :: %__MODULE__{
          duration: String.t(),
          push_provider: ExStreamClient.Model.PushProviderResponse.t()
        }
end