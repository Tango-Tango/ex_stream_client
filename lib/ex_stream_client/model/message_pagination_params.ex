defmodule ExStreamClient.Model.MessagePaginationParams do
  @moduledoc "Schema representing a MessagePaginationParams"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  defstruct [
    :created_at_after,
    :created_at_after_or_equal,
    :created_at_around,
    :created_at_before,
    :created_at_before_or_equal,
    :id_around,
    :id_gt,
    :id_gte,
    :id_lt,
    :id_lte,
    :limit
  ]

  @nested_components created_at_after: :datetime,
                     created_at_after_or_equal: :datetime,
                     created_at_around: :datetime,
                     created_at_before: :datetime,
                     created_at_before_or_equal: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          created_at_after: (DateTime.t() | integer() | String.t()) | nil,
          created_at_after_or_equal: (DateTime.t() | integer() | String.t()) | nil,
          created_at_around: (DateTime.t() | integer() | String.t()) | nil,
          created_at_before: (DateTime.t() | integer() | String.t()) | nil,
          created_at_before_or_equal: (DateTime.t() | integer() | String.t()) | nil,
          id_around: String.t() | nil,
          id_gt: String.t() | nil,
          id_gte: String.t() | nil,
          id_lt: String.t() | nil,
          id_lte: String.t() | nil,
          limit: integer() | nil
        }
end
