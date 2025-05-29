defmodule ExStreamClient.Model.XiaomiConfig do
  @moduledoc "Schema representing a XiaomiConfig"
  use ExStreamClient.Jason
  defstruct [:disabled, :package_name, :secret]

  @type t :: %__MODULE__{
          disabled: boolean() | nil,
          package_name: String.t() | nil,
          secret: String.t() | nil
        }
end