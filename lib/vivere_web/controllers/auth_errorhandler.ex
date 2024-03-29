defmodule VivereWeb.AuthErrorHandler do
  use VivereWeb, :controller

  @moduledoc false

  def call(conn, :not_authenticated) do
    conn
    |> put_status(401)
    |> json(%{error: %{code: 401, message: "The user is not authenticated"}})
  end
end
