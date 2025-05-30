defmodule ExStreamClient.Model.APNS do
  @moduledoc "Schema representing a APNS"
  use ExStreamClient.Jason
  @enforce_keys [:body, :title]
  defstruct [:body, :"content-available", :data, :"mutable-content", :sound, :title]
  @nested_components %{}
  def nested_components do
    @nested_components
  end

  @type t :: %__MODULE__{
          body: String.t(),
          "content-available": integer() | nil,
          data: map() | nil,
          "mutable-content": integer() | nil,
          sound: String.t() | nil,
          title: String.t()
        }
end
