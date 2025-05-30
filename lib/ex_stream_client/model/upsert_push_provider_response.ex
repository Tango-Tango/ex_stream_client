defmodule ExStreamClient.Model.UpsertPushProviderResponse do
  @moduledoc "Schema representing a UpsertPushProviderResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:duration, :push_provider]
  defstruct [:duration, :push_provider]
  @nested_components push_provider: ExStreamClient.Model.PushProviderResponse
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          push_provider: ExStreamClient.Model.PushProviderResponse.t()
        }
end
