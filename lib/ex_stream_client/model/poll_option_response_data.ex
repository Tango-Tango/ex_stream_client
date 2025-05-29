defmodule ExStreamClient.Model.PollOptionResponseData do
  @moduledoc "Schema representing a PollOptionResponseData"
  use ExStreamClient.Jason
  @enforce_keys [:custom, :id, :text]
  defstruct [:id, :text, :custom]
  @type t :: %__MODULE__{id: String.t(), text: String.t(), custom: map()}
end