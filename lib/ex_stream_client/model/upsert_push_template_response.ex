defmodule ExStreamClient.Model.UpsertPushTemplateResponse do
  @moduledoc "Schema representing a UpsertPushTemplateResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration]
  defstruct [:duration, :template]

  @type t :: %__MODULE__{
          duration: String.t(),
          template: ExStreamClient.Model.PushTemplate.t() | nil
        }
end