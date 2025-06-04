defmodule ExStreamClient.Token.Server do
  use Joken.Config

  @cache_key_prefix __MODULE__

  @impl true
  def token_config, do: %{} |> add_claim("server", fn -> true end)

  @doc """
  Returns the signer used for server tokens.
  """
  @spec signer() :: Joken.Signer.t()
  def signer do
    signer(ExStreamClient.Config.api_key_secret())
  end

  @doc """
  Returns the signer used for server tokens with a specific API key secret.
  """
  @spec signer(String.t()) :: Joken.Signer.t()
  def signer(secret) do
    Joken.Signer.create(
      "HS256",
      secret
    )
  end

  @doc """
  Gets a server token using the default API key from config.
  Tokens are cached per API key to avoid regenerating them unnecessarily.
  """
  @spec get() :: {:ok, String.t()} | {:error, any()}
  def get() do
    key = ExStreamClient.Config.api_key()
    secret = ExStreamClient.Config.api_key_secret()
    get(key, secret)
  end

  @doc """
  Gets a server token for the specified API key and API key secret.
  Tokens are cached per API key to avoid regenerating them unnecessarily.
  """
  @spec get(String.t(), String.t()) :: {:ok, String.t()} | {:error, any()}
  def get(key, secret) when is_binary(key) and is_binary(secret) do
    cache_key = cache_key_for_api_key(key)

    case :persistent_term.get(cache_key, :not_found) do
      :not_found ->
        case generate_token(secret) do
          {:ok, token, _} ->
            :persistent_term.put(cache_key, token)
            {:ok, token}

          {:error, reason} ->
            {:error, reason}
        end

      token ->
        {:ok, token}
    end
  end

  defp generate_token(secret) do
    generate_and_sign(
      %{"server" => true},
      signer(secret)
    )
  end

  defp cache_key_for_api_key(key) do
    {@cache_key_prefix, key}
  end
end
