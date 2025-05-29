defmodule ExStreamClient.Model.HuaweiConfigFields do
  @moduledoc "Schema representing a HuaweiConfigFields"
  use ExStreamClient.Jason
  @enforce_keys [:enabled]
  defstruct [:enabled, :id, :secret]
  @type t :: %__MODULE__{enabled: boolean(), id: String.t() | nil, secret: String.t() | nil}
end