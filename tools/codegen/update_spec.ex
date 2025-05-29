defmodule ExStreamClient.Tools.Codegen.UpdateSpec do
  @moduledoc """
  Updates the OpenAPI spec to the latest version
  """

  @target "tools/spec"
  @url "https://raw.githubusercontent.com/GetStream/protocol/main/openapi/v2/chat-serverside-api.yaml"

  @doc """
  Updates the OpenAPI spec to the latest version
  """
  def update_chat_specification() do
    File.mkdir_p!(@target)

    System.cmd("curl", ["-L", @url, "-o", get_chat_specification_path()])
  end

  def get_chat_specification_path() do
    "#{@target}/chat.yaml"
  end
end
