defmodule ExStreamClient.Model.CreateImportV2TaskRequest do
  @moduledoc "Schema representing a CreateImportV2TaskRequest"
  use ExStreamClient.JSON
  use ExStreamClient.TypeInterner
  @enforce_keys [:product, :settings]
  defstruct [:product, :settings, :user, :user_id]

  @nested_components product: :enum,
                     settings: ExStreamClient.Model.ImportV2TaskSettings,
                     user: ExStreamClient.Model.UserRequest
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          product: :feeds | :chat,
          settings: ExStreamClient.Model.ImportV2TaskSettings.t(),
          user: ExStreamClient.Model.UserRequest.t() | nil,
          user_id: String.t() | nil
        }
end
