defmodule ExStreamClient.Model.LabelsRequest do
  @moduledoc "Schema representing a LabelsRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:content]
  defstruct [:category, :content, :content_id, :content_type, :dry_run, :policy, :user_id]
  @nested_components content_type: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          category: String.t() | nil,
          content: String.t(),
          content_id: String.t() | nil,
          content_type: (:username | :message | :text) | nil,
          dry_run: boolean() | nil,
          policy: String.t() | nil,
          user_id: String.t() | nil
        }
end
