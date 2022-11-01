defmodule VivereWeb.Controllers.UserLogin do
  use VivereWeb, :controller

  alias Plug.Conn
  alias Vivere.Auth.UserPassLogin

  @moduledoc false

  @spec login(Conn.t(), UserPassLogin.t()) :: Conn.t()
  def login(conn, user_pass_login) do
    case Pow.Plug.authenticate_user(conn, user_pass_login) do
      {:ok, conn} -> json(conn, %{token: conn.private[:api_access_token]})
      {:error, conn} ->
        conn
        |> put_status(401)
        |> json(%{error: %{status: 401, message: "Invalid email or password"}})
    end
  end
end
