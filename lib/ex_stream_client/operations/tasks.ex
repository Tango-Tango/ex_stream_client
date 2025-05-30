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
    request_opts =
      [url: "/api/v2/tasks/#{id}", method: :get, params: %{}, decode_json: [keys: :atoms]] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          response_handlers = %{
            200 => ExStreamClient.Model.GetTaskResponse,
            400 => ExStreamClient.Model.APIError,
            429 => ExStreamClient.Model.APIError
          }

          parsed =
            case Map.get(response_handlers, response.status) do
              nil -> {:error, response.body}
              mod -> {:ok, mod.decode(response.body)}
            end

          {request, %{response | body: parsed}}
        end
      )

    ExStreamClient.Client.request(r)
  end
end
