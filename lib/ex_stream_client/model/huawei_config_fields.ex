defmodule ExStreamClient.Model.HuaweiConfigFields do
  @moduledoc "Schema representing a HuaweiConfigFields"
  use ExStreamClient.Jason
  @enforce_keys [:enabled]
  defstruct [:enabled, :id, :secret]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{enabled: boolean(), id: String.t() | nil, secret: String.t() | nil}
end
