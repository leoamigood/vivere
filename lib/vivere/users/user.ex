defmodule Vivere.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema

  @moduledoc false

  schema "users" do
    pow_user_fields()

    timestamps()
  end
end
