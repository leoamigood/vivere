defmodule Vivere.Repo do
  use Ecto.Repo,
    otp_app: :vivere,
    adapter: Ecto.Adapters.Postgres
end
