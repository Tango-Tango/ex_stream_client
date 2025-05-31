defmodule ExStreamClient.Model.CheckSNSRequest do
  @moduledoc "Schema representing a CheckSNSRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:sns_key, :sns_secret, :sns_topic_arn]
  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          sns_key: String.t() | nil,
          sns_secret: String.t() | nil,
          sns_topic_arn: String.t() | nil
        }
end
