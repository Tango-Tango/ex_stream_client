defmodule ExStreamClient.Model.HuaweiConfig do
  @moduledoc "Schema representing a HuaweiConfig"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:disabled, :id, :secret]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          disabled: boolean() | nil,
          id: String.t() | nil,
          secret: String.t() | nil
        }
end
