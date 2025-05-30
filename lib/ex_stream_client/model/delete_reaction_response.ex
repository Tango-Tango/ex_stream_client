defmodule ExStreamClient.Model.DeleteReactionResponse do
  @moduledoc "Schema representing a DeleteReactionResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :message, :reaction]
  defstruct [:duration, :message, :reaction]

  @nested_components %{
    message: ExStreamClient.Model.MessageResponse,
    reaction: ExStreamClient.Model.ReactionResponse
  }
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          message: ExStreamClient.Model.MessageResponse.t(),
          reaction: ExStreamClient.Model.ReactionResponse.t()
        }
end
