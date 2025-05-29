defmodule ExStreamClient.Model.CustomActionRequest do
  @moduledoc "Schema representing a CustomActionRequest"
  use ExStreamClient.Jason
  defstruct [:id, :options]
  @type t :: %__MODULE__{id: String.t() | nil, options: map() | nil}
end