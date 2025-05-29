defmodule ExStreamClient.Chat.Commands do
  @moduledoc "
	Modules for interacting with the `chat/commands` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/chat/commands
	"
  require Logger
  @doc ~S"
	Create command
	
	### Required Arguments:
		- `payload`: CreateCommandRequest
	"
  @spec create_command(ExStreamClient.Model.CreateCommandRequest.t()) ::
          {:ok, ExStreamClient.Model.CreateCommandResponse.t()} | {:error, any()}
  def create_command(payload) do
    request_opts = [url: "/api/v2/chat/commands", method: :post, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "CreateCommandResponse"}
                )

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end

  @doc ~S"
	List commands
	
	### Required Arguments:
		
	"
  @spec list_commands() :: {:ok, ExStreamClient.Model.ListCommandsResponse.t()} | {:error, any()}
  def list_commands() do
    request_opts = [url: "/api/v2/chat/commands", method: :get, params: %{}] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "ListCommandsResponse"}
                )

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end

  @doc ~S"
	Update command
	
	### Required Arguments:
		- `name`
		- `payload`: UpdateCommandRequest
	"
  @spec update_command(String.t(), ExStreamClient.Model.UpdateCommandRequest.t()) ::
          {:ok, ExStreamClient.Model.UpdateCommandResponse.t()} | {:error, any()}
  def update_command(name, payload) do
    request_opts =
      [url: "/api/v2/chat/commands/#{name}", method: :put, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "UpdateCommandResponse"}
                )

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end

  @doc ~S"
	Get command
	
	### Required Arguments:
		- `name`
	"
  @spec get_command(String.t()) ::
          {:ok, ExStreamClient.Model.GetCommandResponse.t()} | {:error, any()}
  def get_command(name) do
    request_opts = [url: "/api/v2/chat/commands/#{name}", method: :get, params: %{}] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response({:ok, response.body}, {:component, "GetCommandResponse"})

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end

  @doc ~S"
	Delete command
	
	### Required Arguments:
		- `name`
	"
  @spec delete_command(String.t()) ::
          {:ok, ExStreamClient.Model.DeleteCommandResponse.t()} | {:error, any()}
  def delete_command(name) do
    request_opts = [url: "/api/v2/chat/commands/#{name}", method: :delete, params: %{}] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "DeleteCommandResponse"}
                )

              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end
end