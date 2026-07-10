defmodule ExStreamClient.Model.FeedsPreferencesResponse do
  @moduledoc "Schema representing a FeedsPreferencesResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  defstruct [
    :comment,
    :comment_mention,
    :comment_reaction,
    :comment_reply,
    :custom_activity_types,
    :follow,
    :mention,
    :reaction
  ]

  @nested_components []
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          comment: String.t() | nil,
          comment_mention: String.t() | nil,
          comment_reaction: String.t() | nil,
          comment_reply: String.t() | nil,
          custom_activity_types: %{optional(String.t()) => String.t()} | nil,
          follow: String.t() | nil,
          mention: String.t() | nil,
          reaction: String.t() | nil
        }
end
