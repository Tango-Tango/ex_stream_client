defmodule ExStreamClient.Blocklists do
  @moduledoc "
	Modules for interacting with the `blocklists` group of OpenAI APIs

	API Reference: https://platform.openai.com/docs/api-reference/blocklists
	"
  require Logger
  @doc ~S"
	Create block list
	
	### Required Arguments:
		- `payload`: CreateBlockListRequest
	"
  @spec create_block_list(ExStreamClient.Model.CreateBlockListRequest.t()) ::
          {:ok, ExStreamClient.Model.CreateBlockListResponse.t()} | {:error, any()}
  def create_block_list(payload) do
    request_opts = [url: "/api/v2/blocklists", method: :post, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "CreateBlockListResponse"}
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
	List block lists
	
	### Required Arguments:
		
	### Optional Arguments:
		- `team`
	"
  @spec list_block_lists() ::
          {:ok, ExStreamClient.Model.ListBlockListResponse.t()} | {:error, any()}
  @spec list_block_lists(team: String.t()) ::
          {:ok, ExStreamClient.Model.ListBlockListResponse.t()} | {:error, any()}
  def list_block_lists(opts \\ []) do
    request_opts =
      [
        url: "/api/v2/blocklists",
        method: :get,
        params:
          Keyword.merge([], Keyword.take(opts, [:team]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
          |> Map.new()
      ] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "ListBlockListResponse"}
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
	Update block list
	
	### Required Arguments:
		- `name`
		- `payload`: UpdateBlockListRequest
	"
  @spec update_block_list(String.t(), ExStreamClient.Model.UpdateBlockListRequest.t()) ::
          {:ok, ExStreamClient.Model.UpdateBlockListResponse.t()} | {:error, any()}
  def update_block_list(name, payload) do
    request_opts =
      [url: "/api/v2/blocklists/#{name}", method: :put, params: %{}] ++ [json: payload]

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "UpdateBlockListResponse"}
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
	Get block list
	
	### Required Arguments:
		- `name`
	### Optional Arguments:
		- `team`
	"
  @spec get_block_list(String.t()) ::
          {:ok, ExStreamClient.Model.GetBlockListResponse.t()} | {:error, any()}
  @spec get_block_list(String.t(), team: String.t()) ::
          {:ok, ExStreamClient.Model.GetBlockListResponse.t()} | {:error, any()}
  def get_block_list(name, opts \\ []) do
    request_opts =
      [
        url: "/api/v2/blocklists/#{name}",
        method: :get,
        params:
          Keyword.merge([], Keyword.take(opts, [:team]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
          |> Map.new()
      ] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed =
                Codegen.convert_response(
                  {:ok, response.body},
                  {:component, "GetBlockListResponse"}
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
	Delete block list
	
	### Required Arguments:
		- `name`
	### Optional Arguments:
		- `team`
	"
  @spec delete_block_list(String.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  @spec delete_block_list(String.t(), team: String.t()) ::
          {:ok, ExStreamClient.Model.Response.t()} | {:error, any()}
  def delete_block_list(name, opts \\ []) do
    request_opts =
      [
        url: "/api/v2/blocklists/#{name}",
        method: :delete,
        params:
          Keyword.merge([], Keyword.take(opts, [:team]))
          |> Enum.reject(fn {_k, v} -> is_nil(v) end)
          |> Map.new()
      ] ++ []

    r =
      Req.new(request_opts)
      |> Req.Request.append_response_steps(
        decode: fn {request, response} ->
          case response.status do
            code when code in 200..299 ->
              parsed = Codegen.convert_response({:ok, response.body}, {:component, "Response"})
              {request, %{response | body: {:ok, parsed}}}

            _ ->
              {request, response}
          end
        end
      )

    ExStreamClient.Client.request(r)
  end
end