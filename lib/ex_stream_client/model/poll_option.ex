defmodule ExStreamClient.Model.PollOption do
  @moduledoc "Schema representing a PollOption"
  use ExStreamClient.Jason
  @enforce_keys [:custom, :id, :text]
  defstruct [:id, :text, :custom]
  @type t :: %__MODULE__{id: String.t(), text: String.t(), custom: map()}
end