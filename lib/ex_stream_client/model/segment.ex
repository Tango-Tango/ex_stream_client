defmodule ExStreamClient.Model.Segment do
  @moduledoc "Schema representing a Segment"
  use ExStreamClient.Jason

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
    :id,
    :name,
    :size,
    :type,
    :description,
    :filter,
    :created_at,
    :updated_at,
    :deleted_at,
    :task_id,
    :all_sender_channels,
    :all_users
  ]

  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t(),
          size: integer(),
          type: String.t(),
          description: String.t() | nil,
          filter: map() | nil,
          created_at: float(),
          updated_at: float(),
          deleted_at: float() | nil,
          task_id: String.t() | nil,
          all_sender_channels: boolean(),
          all_users: boolean()
        }
end