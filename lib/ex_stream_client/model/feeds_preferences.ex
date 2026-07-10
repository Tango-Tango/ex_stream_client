defmodule ExStreamClient.Model.FeedsPreferences do
  @moduledoc "Schema representing a FeedsPreferences"
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

  @nested_components comment: :enum,
                     comment_mention: :enum,
                     comment_reaction: :enum,
                     comment_reply: :enum,
                     follow: :enum,
                     mention: :enum,
                     reaction: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          comment: (:none | :all) | nil,
          comment_mention: (:none | :all) | nil,
          comment_reaction: (:none | :all) | nil,
          comment_reply: (:none | :all) | nil,
          custom_activity_types: %{optional(String.t()) => String.t()} | nil,
          follow: (:none | :all) | nil,
          mention: (:none | :all) | nil,
          reaction: (:none | :all) | nil
        }
end
