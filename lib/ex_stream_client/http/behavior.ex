defmodule ExStreamClient.Http.Behavior do
  @callback request(Req.Request.t(), Keyword.t()) ::
              {:ok, Req.Response.t()} | {:error, Exception.t()}
end
