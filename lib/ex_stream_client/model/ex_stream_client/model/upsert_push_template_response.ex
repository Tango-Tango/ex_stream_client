defmodule ExStreamClient.Model.UpsertPushTemplateResponse do
  @moduledoc "Schema representing a UpsertPushTemplateResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:template, :duration]

  @type t :: %__MODULE__{
          template: ExStreamClient.Model.PushTemplate.t() | nil,
          duration: String.t()
        }
end