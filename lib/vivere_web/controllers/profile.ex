defmodule VivereWeb.Controllers.Profile do
  use VivereWeb, :controller

  @moduledoc false

  def profile(conn, _params) do
    json(conn, %{logged_token: conn.private[:api_access_token], user_id: conn.private[:user_id]})
    conn
  end
end
