defmodule ExStreamClient.Model.NullTime do
  @moduledoc "Schema representing a NullTime"
  use ExStreamClient.Jason
  defstruct []
  @type t :: %__MODULE__{}
end