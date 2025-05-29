defmodule ExStreamClient.Model.FCM do
  @moduledoc "Schema representing a FCM"
  use ExStreamClient.Jason
  defstruct [:data]
  @type t :: %__MODULE__{data: map() | nil}
end