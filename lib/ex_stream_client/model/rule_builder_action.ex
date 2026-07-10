defmodule ExStreamClient.Model.RuleBuilderAction do
  @moduledoc "Schema representing a RuleBuilderAction"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  defstruct [:ban_options, :call_options, :flag_user_options, :skip_inbox, :type]

  @nested_components ban_options: ExStreamClient.Model.BanOptions,
                     call_options: ExStreamClient.Model.CallActionOptions,
                     flag_user_options: ExStreamClient.Model.FlagUserOptions,
                     type: :enum
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          ban_options: ExStreamClient.Model.BanOptions.t() | nil,
          call_options: ExStreamClient.Model.CallActionOptions.t() | nil,
          flag_user_options: ExStreamClient.Model.FlagUserOptions.t() | nil,
          skip_inbox: boolean() | nil,
          type:
            (:webhook_only
             | :call_warning
             | :warning
             | :kick_user
             | :end_call
             | :call_blur
             | :blur
             | :mute_audio
             | :mute_video
             | :bounce_remove_content
             | :bounce_content
             | :bounce_flag_content
             | :shadow_content
             | :block_content
             | :flag_content
             | :flag_user
             | :ban_user)
            | nil
        }
end
