defmodule ExStreamClient.Model.PollOptionResponse do
  @moduledoc "Schema representing a PollOptionResponse"
  use ExStreamClient.Jason
  @enforce_keys [:duration, :poll_option]
  defstruct [:duration, :poll_option]
  @nested_components %{poll_option: ExStreamClient.Model.PollOptionResponseData}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          duration: String.t(),
          poll_option: ExStreamClient.Model.PollOptionResponseData.t()
        }
end
