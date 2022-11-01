defmodule VivereWeb.Controllers.UserRegistration do
  use VivereWeb, :controller

  alias Ecto.Changeset
  alias Plug.Conn
  alias Vivere.Auth.UserRegistration
  alias VivereWeb.ErrorHelpers

  @moduledoc false

  @spec register(Conn.t(), UserRegistration.t()) :: Conn.t()
  def register(conn, user_registration_command) do
    case Pow.Plug.create_user(conn, user_registration_command) do
      {:ok, _user, conn} -> json(conn, %{token: conn.private[:api_access_token]})
      {:error, changeset, conn} ->
        errors = Changeset.traverse_errors(changeset, &ErrorHelpers.translate_error/1)
        conn
        |> put_status(500)
        |> json(%{error: %{status: 500, message: "Couldn't create user", errors: errors}})
    end
  end
end
