defmodule ExStreamClient.Model.Segment do
  @moduledoc "Schema representing a Segment"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner

  @enforce_keys [
    :all_sender_channels,
    :all_users,
    :created_at,
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
    :task_id,
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
          deleted_at: (DateTime.t() | integer() | String.t()) | nil,
          description: String.t() | nil,
          filter: %{optional(String.t()) => any()} | nil,
          id: String.t(),
          name: String.t(),
          size: integer(),
          task_id: String.t() | nil,
          type: String.t(),
          updated_at: DateTime.t() | integer() | String.t()
        }
end
