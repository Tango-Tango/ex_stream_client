defmodule Mix.Tasks.Gen.Client do
  use Mix.Task
  require Logger

  alias ExStreamClient.Tools.Codegen
  import ExStreamClient.Tools.Codegen.UpdateSpec, only: [get_chat_specification_path: 0]

  @shortdoc "Generates Stream client from OpenAPI spec"
  def run(_) do
    Logger.info("Generating Stream client from OpenAPI spec.")

    docs = Codegen.get_documentation(get_chat_specification_path())

    Codegen.GenerateModel.run(docs)
    Codegen.GenerateOperations.run(docs)
  end
end
