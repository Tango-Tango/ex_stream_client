defmodule ExStreamClient.Tasks do
  @moduledoc "
	Modules for interacting with the `tasks` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/tasks
	"
  require Logger
  @doc ~S"
	Get status of a task
	
	### Required Arguments:
		- `id`
	"
  @spec get_task(String.t()) :: {:ok, ExStreamClient.Model.GetTaskResponse.t()} | {:error, any()}
  def get_task(id) do
    request_opts = [url: "/api/v2/tasks/#{id}", method: :get, params: %{}] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response({:ok, response.body}, {:component, "GetTaskResponse"})

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end
end