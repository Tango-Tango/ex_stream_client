defmodule ExStreamClient.Model.ChannelBatchUpdateRequest do
  @moduledoc "Schema representing a ChannelBatchUpdateRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:filter, :operation]
  defstruct [:data, :filter, :members, :operation]

  @nested_components data: ExStreamClient.Model.ChannelDataUpdate,
                     members: ExStreamClient.Model.ChannelBatchMemberRequest,
                     operation: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          data: ExStreamClient.Model.ChannelDataUpdate.t() | nil,
          filter: %{optional(String.t()) => any()},
          members: [ExStreamClient.Model.ChannelBatchMemberRequest.t()] | nil,
          operation:
            :updateData
            | :unarchive
            | :archive
            | :show
            | :hide
            | :demoteModerators
            | :addModerators
            | :assignRoles
            | :invites
            | :inviteMembers
            | :removeMembers
            | :addMembers
        }
end
