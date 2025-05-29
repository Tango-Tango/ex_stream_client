defmodule ExStreamClient.Model.BlockListOptions do
  @moduledoc "Schema representing a BlockListOptions"
  use ExStreamClient.Jason
  @enforce_keys [:behavior, :blocklist]
  defstruct [:behavior, :blocklist]
  @type t :: %__MODULE__{behavior: :shadow_block | :block | :flag, blocklist: String.t()}
end