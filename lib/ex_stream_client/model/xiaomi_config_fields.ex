defmodule ExStreamClient.Model.XiaomiConfigFields do
  @moduledoc "Schema representing a XiaomiConfigFields"
  use ExStreamClient.Jason
  @enforce_keys [:enabled]
  defstruct [:enabled, :package_name, :secret]
  @nested_components %{}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          enabled: boolean(),
          package_name: String.t() | nil,
          secret: String.t() | nil
        }
end
