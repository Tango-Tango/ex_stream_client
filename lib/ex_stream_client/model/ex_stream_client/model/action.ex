defmodule ExStreamClient.Model.Action do
  @moduledoc "Schema representing a Action"
  use ExStreamClient.Jason
  @enforce_keys [:name, :text, :type]
  defstruct [:name, :type, :value, :text, :style]

  @type t :: %__MODULE__{
          name: String.t(),
          type: String.t(),
          value: String.t() | nil,
          text: String.t(),
          style: String.t() | nil
        }
end