defmodule ExStreamClient.Model.UpdateMessageRequest do
  @moduledoc "Schema representing a UpdateMessageRequest"
  use ExStreamClient.Jason
  @enforce_keys [:message]
  defstruct [:message, :skip_enrich_url, :skip_push]
  @nested_components %{message: ExStreamClient.Model.MessageRequest}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          message: ExStreamClient.Model.MessageRequest.t(),
          skip_enrich_url: boolean() | nil,
          skip_push: boolean() | nil
        }
end
