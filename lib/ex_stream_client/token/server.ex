defmodule ExStreamClient.Token.Server do
  use Joken.Config

  @cache_key __MODULE__

  @impl true
  def token_config, do: %{} |> add_claim("server", fn -> true end)

  @doc """
  Returns the signer used for server tokens.
  """
  @spec signer() :: Joken.Signer.t()
  def signer do
    Joken.Signer.create(
      "HS256",
      ExStreamClient.Config.api_key_secret()
    )
  end

  @spec get() :: {:ok, String.t()} | {:error, any()}
  def get() do
    case :persistent_term.get(@cache_key, :not_found) do
      :not_found ->
        case generate_token() do
          {:ok, token, _} ->
            :persistent_term.put(@cache_key, token)
            {:ok, token}

          {:error, reason} ->
            {:error, reason}
        end

      token ->
        {:ok, token}
    end
  end

  defp generate_token() do
    generate_and_sign(
      %{"server" => true},
      signer()
    )
  end
end
