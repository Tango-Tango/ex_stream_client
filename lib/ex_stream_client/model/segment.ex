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

  @type t :: %__MODULE__{
          all_sender_channels: boolean(),
          all_users: boolean(),
          created_at: float(),
          deleted_at: float() | nil,
          description: String.t() | nil,
          filter: map() | nil,
          id: String.t(),
          name: String.t(),
          size: integer(),
          task_id: String.t() | nil,
          type: String.t(),
          updated_at: float()
        }
end