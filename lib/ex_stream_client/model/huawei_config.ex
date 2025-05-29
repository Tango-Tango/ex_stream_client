defmodule ExStreamClient.Model.HuaweiConfig do
  @moduledoc "Schema representing a HuaweiConfig"
  use ExStreamClient.Jason
  defstruct [:disabled, :id, :secret]

  @type t :: %__MODULE__{
          disabled: boolean() | nil,
          id: String.t() | nil,
          secret: String.t() | nil
        }
end