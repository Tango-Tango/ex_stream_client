defmodule ExStreamClient.Model.XiaomiConfig do
  @moduledoc "Schema representing a XiaomiConfig"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:disabled, :package_name, :secret]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          disabled: boolean() | nil,
          package_name: String.t() | nil,
          secret: String.t() | nil
        }
end
