defmodule ExStreamClient.Model.UpsertPushProviderRequest do
  @moduledoc "Schema representing a UpsertPushProviderRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:push_provider]
  @nested_components push_provider: ExStreamClient.Model.PushProvider
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{push_provider: ExStreamClient.Model.PushProvider.t() | nil}
end
