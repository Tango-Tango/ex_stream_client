defmodule ExStreamClient.Model.FlagMessageDetails do
  @moduledoc "Schema representing a FlagMessageDetails"
  use ExStreamClient.Jason
  defstruct [:pin_changed, :should_enrich, :skip_push, :updated_by_id]

  @type t :: %__MODULE__{
          pin_changed: boolean() | nil,
          should_enrich: boolean() | nil,
          skip_push: boolean() | nil,
          updated_by_id: String.t() | nil
        }
end