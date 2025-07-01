defmodule ExStreamClient.Model.PushConfig do
  @moduledoc "Schema representing a PushConfig"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:version]
  defstruct [:offline_only, :version]
  @nested_components version: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{offline_only: boolean() | nil, version: :v3 | :v2 | :v1}
end
