defmodule ExStreamClient.Model.PagerResponse do
  @moduledoc "Schema representing a PagerResponse"
  use ExStreamClient.Jason
  defstruct [:next, :prev]
  @type t :: %__MODULE__{next: String.t() | nil, prev: String.t() | nil}
end