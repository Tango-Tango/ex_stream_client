defmodule ExStreamClient.Config do
  @moduledoc """
  Configuration for the Stream client.
  """

  @app :ex_stream_client
  @default_endpoint "https://chat.stream-io-api.com"

  @spec endpoint :: String.t()
  def endpoint, do: Application.get_env(@app, :endpoint, @default_endpoint)

  @spec api_key :: String.t()
  def api_key, do: Application.get_env(@app, :api_key, nil)

  @spec api_key_secret :: String.t()
  def api_key_secret, do: Application.get_env(@app, :api_key_secret, nil)

  @default_log_config [
    level: :info,
    request: [],
    response: []
  ]

  @doc """
  Returns the logging configuration.
  """
  @spec log :: keyword()
  def log, do: Application.get_env(@app, :log, @default_log_config)

  @doc """
  Returns the log level.
  """
  @spec log_level :: atom()
  def log_level, do: Keyword.get(log(), :level, :info)

  @doc """
  Checks if logging is enabled for a specific category and touchpoint.

  ## Examples

      log_enabled?(:request, :url)    # Check if request URL logging is enabled
      log_enabled?(:request, :body)   # Check if request body logging is enabled
      log_enabled?(:response, :body)  # Check if response body logging is enabled
  """
  @spec log_enabled?(atom(), atom()) :: boolean()
  def log_enabled?(category, key) do
    log()
    |> Keyword.get(category, [])
    |> Enum.member?(key)
  end
end
