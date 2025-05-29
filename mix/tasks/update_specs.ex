defmodule Mix.Tasks.Gen.Client.UpdateSpec do
  use Mix.Task
  require Logger

  alias ExStreamClient.Tools.Codegen

  @shortdoc "Updates the OpenAPI spec to the latest version"

  def run(_) do
    Logger.info("Updating OpenAPI spec to the latest version")

    Codegen.UpdateSpec.update_chat_specification()
  end
end
