defmodule ExStreamClient.Model.CheckSQSRequest do
  @moduledoc "Schema representing a CheckSQSRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:sqs_key, :sqs_secret, :sqs_url]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          sqs_key: String.t() | nil,
          sqs_secret: String.t() | nil,
          sqs_url: String.t() | nil
        }
end
