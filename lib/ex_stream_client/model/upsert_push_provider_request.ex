defmodule ExStreamClient.Model.UpsertPushProviderRequest do
  @moduledoc "Schema representing a UpsertPushProviderRequest"
  use ExStreamClient.Jason
  defstruct [:push_provider]
  @type t :: %__MODULE__{push_provider: ExStreamClient.Model.PushProvider.t() | nil}
end