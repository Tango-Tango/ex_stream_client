defmodule ExStreamClient.Model.SegmentResponse do
  @moduledoc "Schema representing a SegmentResponse"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  @enforce_keys [
    :all_sender_channels,
    :all_users,
    :created_at,
    :deleted_at,
    :description,
    :filter,
    :id,
    :name,
    :size,
    :type,
    :updated_at
  ]
  defstruct [
    :all_sender_channels,
    :all_users,
    :created_at,
    :deleted_at,
    :description,
    :filter,
    :id,
    :name,
    :size,
    :type,
    :updated_at
  ]

  @nested_components created_at: :datetime, deleted_at: :datetime, updated_at: :datetime
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          all_sender_channels: boolean(),
          all_users: boolean(),
          created_at: DateTime.t() | integer() | String.t(),
          deleted_at: DateTime.t() | integer() | String.t(),
          description: String.t(),
          filter: %{optional(String.t()) => any()},
          id: String.t(),
          name: String.t(),
          size: integer(),
          type: String.t(),
          updated_at: DateTime.t() | integer() | String.t()
        }
end
