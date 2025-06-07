defmodule ExStreamClient.Token.User do
  use Joken.Config

  @impl true
  def token_config do
    %{}
    |> add_claim("user_id", nil, &is_binary/1)
    |> add_claim("exp", nil, &is_integer/1)
    |> add_claim("iat", nil, &is_integer/1)
  end

  @doc """
  Returns the signer used for user tokens.
  """
  @spec signer() :: Joken.Signer.t()
  def signer do
    Joken.Signer.create(
      "HS256",
      ExStreamClient.Config.api_key_secret()
    )
  end

  @doc """
  Generates a user token for the given user ID.

  ## Arguments

  - `user_id`: The user ID to generate a token for.

  ## Options
  - `expires_at`: The expiration time for the token as a `DateTime` struct. If not provided, the token will not expire.
  """
  @spec get(String.t(), DateTime.t() | nil) :: {:ok, String.t()} | {:error, any()}
  def get(user_id, expires_at \\ nil) do
    claims = %{"user_id" => user_id}

    claims =
      if expires_at do
        now = DateTime.utc_now() |> DateTime.to_unix()
        exp = DateTime.to_unix(expires_at)

        claims
        |> Map.put("iat", now)
        |> Map.put("exp", exp)
      else
        claims
      end

    case generate_and_sign(
           claims,
           signer()
         ) do
      {:ok, token, _} -> {:ok, token}
      {:error, reason} -> {:error, reason}
    end
  end
end
