defmodule ExStreamClient.Model.UpdateMessageRequest do
  @moduledoc "Schema representing a UpdateMessageRequest"
  use ExStreamClient.Jason
  @enforce_keys [:message]
  defstruct [:message, :skip_push, :skip_enrich_url]

  @type t :: %__MODULE__{
          message: ExStreamClient.Model.MessageRequest.t(),
          skip_push: boolean() | nil,
          skip_enrich_url: boolean() | nil
        }
end