defmodule ExStreamClient.Model.RuleBuilderAction do
  @moduledoc "Schema representing a RuleBuilderAction"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:type]
  defstruct [
    :ban_options,
    :flag_content_options,
    :flag_user_options,
    :remove_content_options,
    :type
  ]

  @nested_components ban_options: ExStreamClient.Model.BanOptions,
                     flag_content_options: ExStreamClient.Model.FlagContentOptions,
                     flag_user_options: ExStreamClient.Model.FlagUserOptions,
                     remove_content_options: ExStreamClient.Model.BlockContentOptions
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          ban_options: ExStreamClient.Model.BanOptions.t() | nil,
          flag_content_options: ExStreamClient.Model.FlagContentOptions.t() | nil,
          flag_user_options: ExStreamClient.Model.FlagUserOptions.t() | nil,
          remove_content_options: ExStreamClient.Model.BlockContentOptions.t() | nil,
          type: String.t()
        }
end
